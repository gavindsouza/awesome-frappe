require 'net/http'
require 'json'
require 'uri'
require 'set'
require 'date'

# Build-time enricher: populates site.data.fc_marketplace by syncing with
# cloud.frappe.io's marketplace. Mirrors the pattern of github_enricher.rb:
# cache lives in _fc_cache.json (gitignored), survives across builds via the
# Actions bundler-cache, and never appears in commits.
#
# Lookup contract for card.html:
#   - keyed by lowercased "<owner>/<repo>" (matches readme_parser.rb's
#     extraction casing once you call `| downcase`), AND
#   - keyed by "name:<lowercased entry name>" for README entries whose URL
#     is a product page rather than GitHub (e.g. ERPNext -> erpnext.com).
#
# Curated input: _data/fc_alias_map.yml — Jekyll auto-loads it as
# site.data.fc_alias_map, mapping FC slug -> README entry name.

module FCMarketplace
  SEARCH_URL      = 'https://cloud.frappe.io/api/method/press.www.marketplace.index.search?query=&limit=2000'
  CATEGORY_URL    = 'https://cloud.frappe.io/api/method/press.www.marketplace.index.filter_by_category?category=%s'
  SITEMAP_URL     = 'https://cloud.frappe.io/sitemap.xml'
  APP_PAGE_TPL    = 'https://cloud.frappe.io/marketplace/apps/%s'
  INSTALL_URL_TPL = 'https://cloud.frappe.io/dashboard/install-app/%s'

  USER_AGENT      = 'awesome-frappe-fc-enricher (+https://github.com/gavindsouza/awesome-frappe)'
  MAX_PARALLEL    = 8
  MAX_RETRIES     = 2

  # Categories scraped from the FC marketplace megamenu, plus a few extras
  # surfaced via probe. The FC API does not list categories per app on the
  # search endpoint, so we reverse-build a slug -> [category] map by calling
  # filter_by_category for each name below.
  CATEGORIES = [
    'Localization', 'Compliance',
    'Business', 'Accounting', 'Retail', 'Healthcare', 'Customer Relations',
    'Communication',
    'E-commerce',
    'Themes',
    'Storage', 'Files',
    'Mobile',
    'Developer',
    'Productivity', 'Analytics', 'Marketing',
    'Website'
  ].freeze

  class Client
    Result = Struct.new(:data, :matched, :unmatched, :no_github, :sitemap_only,
                        :fetched_count, :cached_count, :app_count, keyword_init: true)

    def initialize(cache_path:, logger: nil)
      @cache_path = cache_path
      @logger     = logger
    end

    def sync(readme_repos:, readme_names:, aliases:)
      apps     = fetch_app_list
      sitemap  = fetch_sitemap
      cats     = fetch_categories
      prev     = load_cache
      gh_for, fetched_count, cached_count = scrape_with_delta(apps, sitemap, prev)

      save_cache(sitemap, gh_for)

      data      = {}
      matched   = []
      unmatched = []
      no_gh     = []

      apps.each do |a|
        slug       = a['name']
        gh         = gh_for[slug]
        alias_name = aliases[slug]
        record = {
          'fc_slug'        => slug,
          'fc_title'       => a['title'],
          'fc_description' => a['description'].to_s.strip,
          'fc_categories'  => cats[slug] || [],
          'install_url'    => INSTALL_URL_TPL % slug,
          'last_seen'      => Date.today.iso8601
        }

        is_match = false
        if alias_name && readme_names.include?(alias_name.downcase)
          data["name:#{alias_name.downcase}"] = record
          is_match = true
        end
        if gh
          data[gh.downcase] = record
          is_match ||= readme_repos.include?(gh.downcase)
        end

        if is_match
          matched << record.merge('owner_repo' => gh)
        elsif gh.nil?
          no_gh << a
        else
          unmatched << record.merge('owner_repo' => gh)
        end
      end

      current_slugs = apps.map { |a| a['name'] }.to_set
      Result.new(
        data: data,
        matched: matched,
        unmatched: unmatched,
        no_github: no_gh,
        sitemap_only: sitemap.keys.to_set - current_slugs,
        fetched_count: fetched_count,
        cached_count: cached_count,
        app_count: apps.size
      )
    end

    private

    def log(msg)
      @logger ? @logger.call(msg) : $stderr.puts(msg)
    end

    def http_get(url)
      uri = URI(url)
      req = Net::HTTP::Get.new(uri)
      req['User-Agent'] = USER_AGENT
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) { |h| h.request(req) }
    end

    def http_get_retry(url)
      attempts = 0
      begin
        attempts += 1
        res = http_get(url)
        raise "HTTP #{res.code}" unless res.code == '200'
        res
      rescue StandardError
        if attempts <= MAX_RETRIES
          sleep(2**attempts)
          retry
        end
        nil
      end
    end

    def fetch_app_list
      res = http_get_retry(SEARCH_URL)
      raise 'FC search API failed' unless res
      JSON.parse(res.body)['message']
    end

    def fetch_sitemap
      res = http_get_retry(SITEMAP_URL)
      raise 'FC sitemap failed' unless res
      map = {}
      res.body.scan(%r{<url>\s*<loc>([^<]+)</loc>\s*(?:<lastmod>([^<]+)</lastmod>)?}m).each do |loc, lm|
        next unless loc.include?('/marketplace/apps/')
        slug = loc.split('/').last
        next if slug == '%3Capp_name%3E'
        map[slug] = lm
      end
      map
    end

    def fetch_categories
      out = Hash.new { |h, k| h[k] = [] }
      CATEGORIES.each do |cat|
        res = http_get_retry(CATEGORY_URL % URI.encode_www_form_component(cat))
        next unless res
        (JSON.parse(res.body)['message'] || []).each { |a| out[a['name']] << cat }
      end
      out
    end

    NORM = ->(s) { s.to_s.downcase.gsub(/[^a-z0-9]/, '') }

    def extract_github(html, slug)
      pairs = html.scan(%r{github\.com/([A-Za-z0-9_.\-]+)/([A-Za-z0-9_.\-]+)})
      cleaned = pairs.reject { |o, r| o.downcase == 'frappe' && r.downcase == 'frappe' }
                     .map { |o, r| [o, r.sub(/\.git$/, '')] }
      return nil if cleaned.empty?

      target = NORM.call(slug)
      scored = Hash.new(0)
      cleaned.each do |pair|
        scored[pair] += 1
        repo_norm = NORM.call(pair[1])
        scored[pair] += 100 if repo_norm == target
        scored[pair] += 10  if repo_norm.include?(target) || target.include?(repo_norm)
      end
      scored.max_by { |_, v| v }.first
    end

    def scrape_with_delta(apps, sitemap, prev)
      prev_lastmod = prev['lastmod'] || {}
      prev_github  = prev['github']  || {}

      to_scrape = apps.select do |a|
        slug = a['name']
        sm_lm = sitemap[slug]
        !prev_github.key?(slug) || prev_lastmod[slug].nil? || sm_lm.nil? || sm_lm > prev_lastmod[slug]
      end

      cached_count = apps.size - to_scrape.size
      gh_for = prev_github.dup
      return [gh_for, 0, cached_count] if to_scrape.empty?

      lock  = Mutex.new
      queue = Queue.new
      to_scrape.each { |a| queue << a }

      threads = Array.new([MAX_PARALLEL, to_scrape.size].min) do
        Thread.new do
          loop do
            a = queue.pop(true) rescue nil
            break unless a
            res = http_get_retry(APP_PAGE_TPL % a['name'])
            gh  = res ? extract_github(res.body, a['name']) : nil
            lock.synchronize { gh_for[a['name']] = gh ? gh.join('/') : nil }
          end
        end
      end
      threads.each(&:join)

      current = apps.map { |a| a['name'] }.to_set
      gh_for.delete_if { |slug, _| !current.include?(slug) }

      [gh_for, to_scrape.size, cached_count]
    end

    def load_cache
      return {} unless File.exist?(@cache_path)
      JSON.parse(File.read(@cache_path))
    rescue StandardError
      {}
    end

    def save_cache(sitemap, gh_for)
      payload = {
        'lastmod'    => sitemap.sort.to_h,
        'github'     => gh_for.sort.to_h,
        'updated_at' => Time.now.utc.iso8601
      }
      File.write(@cache_path, JSON.pretty_generate(payload))
    end
  end
end

# The Jekyll Generator only registers when this file is loaded by Jekyll
# (the scripts/ tools require this file just for the FCMarketplace::Client
# class — they don't want the side effect of plugin registration).
if defined?(Jekyll::Generator)
module Jekyll
  class FCMarketplaceEnricher < Generator
    safe true
    priority :low  # after readme_parser

    CACHE_FILE = '_fc_cache.json'

    def generate(site)
      # Build a lookup of GitHub repos and entry names already in README,
      # using readme_parser's already-populated site.data['projects'].
      readme_repos = Set.new
      readme_names = Set.new
      (site.data['projects'] || []).each do |cat|
        collect_index(cat['items'], readme_repos, readme_names)
        (cat['subcategories'] || []).each { |sc| collect_index(sc['items'], readme_repos, readme_names) }
      end

      aliases = site.data['fc_alias_map'] || {}

      client = FCMarketplace::Client.new(
        cache_path: File.join(site.source, CACHE_FILE),
        logger: ->(m) { Jekyll.logger.info('FCMarketplace:', m) }
      )

      begin
        Jekyll.logger.info 'FCMarketplace:', 'Syncing from cloud.frappe.io...'
        result = client.sync(readme_repos: readme_repos, readme_names: readme_names, aliases: aliases)
        site.data['fc_marketplace'] = result.data
        Jekyll.logger.info 'FCMarketplace:',
                           "#{result.app_count} apps; #{result.matched.size} matched, " \
                           "#{result.unmatched.size} unmatched; #{result.fetched_count} pages fetched, " \
                           "#{result.cached_count} from cache."
      rescue StandardError => e
        Jekyll.logger.warn 'FCMarketplace:', "Sync failed (#{e.message}); cards build without FC data."
        site.data['fc_marketplace'] = {}
      end
    end

    private

    def collect_index(items, repos, names)
      return unless items
      items.each do |it|
        names << it['name'].downcase if it['name']
        if it['github_repo']
          repos << it['github_repo'].downcase
        elsif it['url'] && (m = it['url'].match(%r{https://github\.com/([^/\s)]+)/([^/\s)#?]+?)(?:\.git)?(?:[/)#?]|$)}))
          repos << "#{m[1].downcase}/#{m[2].downcase}"
        end
      end
    end
  end
end
end
