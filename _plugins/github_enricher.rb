require 'net/http'
require 'json'
require 'uri'

module Jekyll
  class GitHubEnricher < Generator
    safe true
    priority :low  # Run after ReadmeParser

    CACHE_FILE = '_github_cache.json'
    CACHE_TTL = 86400  # 24 hours in seconds
    BATCH_SIZE = 50    # Repos per GraphQL query (stay well under node limits)

    def generate(site)
      token = ENV['GITHUB_TOKEN']
      unless token
        Jekyll.logger.warn "GitHubEnricher:", "No GITHUB_TOKEN set, skipping enrichment"
        return
      end

      cache = load_cache(site)
      repos = extract_repos(site.data['projects'])

      Jekyll.logger.info "GitHubEnricher:", "Enriching #{repos.size} GitHub repos..."

      # Separate cached from uncached
      meta = {}
      uncached = []

      repos.each do |owner_repo|
        if cache[owner_repo] && !stale?(cache[owner_repo])
          meta[owner_repo] = cache[owner_repo]['data']
        else
          uncached << owner_repo
        end
      end

      Jekyll.logger.info "GitHubEnricher:", "#{meta.size} from cache, #{uncached.size} to fetch"

      # Fetch uncached repos in batches via GraphQL
      uncached.each_slice(BATCH_SIZE).with_index do |batch, i|
        Jekyll.logger.info "GitHubEnricher:", "Fetching batch #{i + 1} (#{batch.size} repos)..."
        results = fetch_batch(batch, token)

        results.each do |owner_repo, data|
          meta[owner_repo] = data
          cache[owner_repo] = { 'data' => data, 'fetched_at' => Time.now.to_i }
        end
      end

      save_cache(site, cache)
      site.data['github_meta'] = meta
      site.data['github_meta_synced_at'] = Time.now.utc.iso8601
      Jekyll.logger.info "GitHubEnricher:", "Done. #{meta.size} repos enriched."
    end

    private

    def extract_repos(projects)
      repos = []
      return repos unless projects

      projects.each do |category|
        collect_items(category['items'], repos)
        (category['subcategories'] || []).each do |subcat|
          collect_items(subcat['items'], repos)
        end
      end

      repos.uniq
    end

    def collect_items(items, repos)
      return unless items

      items.each do |item|
        url = item['url']
        if url && url.match(%r{https://github\.com/([^/]+/[^/]+?)(?:\.git)?(?:/|$)})
          repos << $1
        end
      end
    end

    def fetch_batch(repos, token)
      # Build GraphQL query with aliased repository lookups
      fragments = repos.each_with_index.map do |owner_repo, idx|
        owner, name = owner_repo.split('/', 2)
        # GraphQL aliases must be valid identifiers
        alias_name = "repo_#{idx}"
        %Q{#{alias_name}: repository(owner: "#{escape_gql(owner)}", name: "#{escape_gql(name)}") { ...RepoFields }}
      end

      query = <<~GQL
        query {
          #{fragments.join("\n  ")}
        }
        fragment RepoFields on Repository {
          nameWithOwner
          stargazerCount
          isArchived
          pushedAt
          isFork
          openIssueCount: issues(states: OPEN) { totalCount }
        }
      GQL

      response = graphql_request(query, token)
      return {} unless response

      results = {}
      repos.each_with_index do |owner_repo, idx|
        alias_name = "repo_#{idx}"
        repo_data = response.dig('data', alias_name)
        next unless repo_data

        results[owner_repo] = {
          'stars' => repo_data['stargazerCount'],
          'archived' => repo_data['isArchived'],
          'pushed_at' => repo_data['pushedAt'],
          'fork' => repo_data['isFork'],
          'open_issues' => repo_data.dig('openIssueCount', 'totalCount'),
        }
      end

      # Log repos that failed (nil in response - likely renamed/deleted)
      repos.each_with_index do |owner_repo, idx|
        alias_name = "repo_#{idx}"
        unless response.dig('data', alias_name)
          Jekyll.logger.warn "GitHubEnricher:", "Not found: #{owner_repo}"
        end
      end

      results
    end

    def graphql_request(query, token)
      uri = URI('https://api.github.com/graphql')
      req = Net::HTTP::Post.new(uri)
      req['Authorization'] = "bearer #{token}"
      req['Content-Type'] = 'application/json'
      req['User-Agent'] = 'awesome-frappe-jekyll'
      req.body = JSON.generate({ query: query })

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
        http.request(req)
      end

      if response.code == '200'
        parsed = JSON.parse(response.body)
        if parsed['errors']
          parsed['errors'].each do |err|
            Jekyll.logger.warn "GitHubEnricher:", "GraphQL error: #{err['message']}"
          end
        end
        parsed
      else
        Jekyll.logger.warn "GitHubEnricher:", "GraphQL request failed: #{response.code}"
        nil
      end
    rescue StandardError => e
      Jekyll.logger.warn "GitHubEnricher:", "GraphQL error: #{e.message}"
      nil
    end

    def escape_gql(str)
      str.gsub('\\', '\\\\').gsub('"', '\\"')
    end

    def stale?(entry)
      Time.now.to_i - (entry['fetched_at'] || 0) > CACHE_TTL
    end

    def load_cache(site)
      path = File.join(site.source, CACHE_FILE)
      return {} unless File.exist?(path)

      JSON.parse(File.read(path))
    rescue StandardError
      {}
    end

    def save_cache(site, cache)
      path = File.join(site.source, CACHE_FILE)
      File.write(path, JSON.pretty_generate(cache))
    end
  end
end
