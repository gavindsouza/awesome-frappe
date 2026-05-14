#!/usr/bin/env ruby
# scripts/fc_reconciliation.rb
#
# Standalone curator's worklist: writes a markdown summary of FC marketplace
# apps not yet in awesome-frappe's README, grouped by proposed README section.
# Run by .github/workflows/fc-reconciliation.yml weekly; output becomes the
# body of a sticky GitHub issue that you triage at your pace.
#
# Reuses the same FCMarketplace::Client used by the build-time enricher,
# so matching logic stays in one place.

require 'yaml'
require 'set'
require_relative '../_plugins/fc_marketplace_enricher'

ROOT       = File.expand_path('..', __dir__)
README     = File.join(ROOT, 'README.md')
ALIAS_PATH = File.join(ROOT, '_data', 'fc_alias_map.yml')
CACHE_PATH = File.join(ROOT, '_fc_cache.json')

# FC category -> README section. Used to bucket unmatched apps in the report.
FC_TO_SECTION = {
  'Localization'       => 'Regional Apps',
  'Compliance'         => 'Regional Apps',
  'Business'           => 'Business Apps',
  'Accounting'         => 'Business Apps',
  'Retail'             => 'Business Apps',
  'Healthcare'         => 'Business Apps',
  'Customer Relations' => 'Business Apps',
  'Communication'      => 'Communications',
  'E-commerce'         => 'eCommerce & Shipping',
  'Themes'             => 'Themes',
  'Storage'            => 'Storage & File Sync',
  'Files'              => 'Storage & File Sync',
  'Mobile'             => 'Other Clients',
  'Developer'          => 'Developer Tooling',
  'Productivity'       => 'Utility Apps',
  'Analytics'          => 'Utility Apps',
  'Marketing'          => 'Utility Apps',
  'Website'            => 'Plugins'
}.freeze

SECTION_ORDER = [
  'Business Apps', 'Utility Apps', 'Communications', 'eCommerce & Shipping',
  'Storage & File Sync', 'Themes', 'Regional Apps', 'Plugins',
  'Developer Tooling', 'Other Clients', 'Other Apps'
].freeze

def propose_section(cats)
  cats.each { |c| return FC_TO_SECTION[c] if FC_TO_SECTION.key?(c) }
  'Other Apps'
end

# Lightweight README index: lower-cased repos and entry names.
def index_readme(path)
  repos = Set.new
  names = Set.new
  File.foreach(path) do |line|
    next unless (m = line.match(/^- \[(.+?)\]\((.+?)\) - /))
    names << m[1].downcase
    if (g = m[2].match(%r{https://github\.com/([^/\s)]+)/([^/\s)#?]+?)(?:\.git)?(?:[/)#?]|$)}))
      repos << "#{g[1].downcase}/#{g[2].downcase}"
    end
  end
  [repos, names]
end

readme_repos, readme_names = index_readme(README)
aliases = File.exist?(ALIAS_PATH) ? (YAML.safe_load(File.read(ALIAS_PATH)) || {}) : {}

client = FCMarketplace::Client.new(cache_path: CACHE_PATH)
result = client.sync(readme_repos: readme_repos, readme_names: readme_names, aliases: aliases)

# Render markdown report to stdout (the workflow pipes this into an issue body).
puts '# Frappe Cloud Marketplace — Reconciliation'
puts
puts "_Generated: #{Time.now.utc.iso8601}_"
puts
puts '## Summary'
puts
puts '| | Count |'
puts '|---|--:|'
puts "| FC marketplace apps (published)      | #{result.app_count} |"
puts "| Sitemap-only (drafts/unpublished)    | #{result.sitemap_only.size} |"
puts "| Already in awesome-frappe            | #{result.matched.size} |"
puts "| **Unmatched (proposed README adds)** | **#{result.unmatched.size}** |"
puts "| No public GitHub URL on FC page      | #{result.no_github.size} |"
puts
puts '## Unmatched apps — proposed README additions'
puts
puts '_Apps are bucketed via their Frappe Cloud categories. Uncategorized apps land in `Other Apps`._'
puts
grouped = result.unmatched.group_by { |r| propose_section(r['fc_categories']) }
ordered = SECTION_ORDER + (grouped.keys - SECTION_ORDER)
ordered.each do |section|
  items = grouped[section]
  next if items.nil? || items.empty?
  puts "### #{section} (#{items.size})"
  puts
  items.sort_by { |r| r['fc_title'].downcase }.each do |r|
    desc = r['fc_description'].gsub(/\s+/, ' ').strip
    cats = r['fc_categories'].empty? ? '' : "  _[#{r['fc_categories'].join(', ')}]_"
    puts "- [#{r['fc_title']}](https://github.com/#{r['owner_repo']}) - #{desc}#{cats}"
  end
  puts
end

unless result.no_github.empty?
  puts '## Apps without a public GitHub URL'
  puts
  puts "_FC marketplace apps where the page didn't surface a usable GitHub repo. Likely proprietary, closed-source, or the page failed to load._"
  puts
  result.no_github.sort_by { |a| a['name'] }.each do |a|
    desc = a['description'].to_s.gsub(/\s+/, ' ').strip[0..200]
    puts "- **#{a['title']}** (`#{a['name']}`) — #{desc}"
  end
  puts
end

unless result.sitemap_only.empty?
  puts '## Sitemap-only slugs (drafts / unpublished)'
  puts
  puts '_Listed in `sitemap.xml` but not returned by the search API. Skipped from candidates._'
  puts
  result.sitemap_only.sort.each { |s| puts "- `#{s}`" }
  puts
end
