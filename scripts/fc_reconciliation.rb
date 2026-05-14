#!/usr/bin/env ruby
# scripts/fc_reconciliation.rb
#
# Edits README.md with proposed additions from the Frappe Cloud marketplace
# and writes a PR-body summary to /tmp/fc_pr_body.md (path override via
# FC_PR_BODY_PATH env var).
#
# Run by .github/workflows/fc-reconciliation.yml weekly. The workflow then
# opens / force-updates a sticky PR (fc-sync/auto-additions branch) so you
# review and merge — or trim and merge — at your pace. Subsequent runs
# regenerate README from main's state and re-propose, so the PR always
# reflects the current gap.
#
# Reuses FCMarketplace::Client from the build-time plugin so matching
# logic stays in one place.

require 'yaml'
require 'set'
require_relative '../_plugins/fc_marketplace_enricher'

ROOT          = File.expand_path('..', __dir__)
README_PATH   = File.join(ROOT, 'README.md')
ALIAS_PATH    = File.join(ROOT, '_data', 'fc_alias_map.yml')
CACHE_PATH    = File.join(ROOT, '_fc_cache.json')
SORTER        = File.join(ROOT, '.github', 'helper', 'record_sorter.rb')
PR_BODY_PATH  = ENV['FC_PR_BODY_PATH'] || '/tmp/fc_pr_body.md'

# FC category -> README section.
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
DEFAULT_SECTION = 'Other Apps'

SECTION_ORDER = [
  'Business Apps', 'Utility Apps', 'Communications', 'eCommerce & Shipping',
  'Storage & File Sync', 'Themes', 'Regional Apps', 'Plugins',
  'Developer Tooling', 'Other Clients', DEFAULT_SECTION
].freeze

def propose_section(cats)
  cats.each { |c| return FC_TO_SECTION[c] if FC_TO_SECTION.key?(c) }
  DEFAULT_SECTION
end

# Lightweight README index: lowercased repos and entry names.
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

# Insert lines into a `#### Section Name` (or `### Section Name`) block in
# README. Inserts before the trailing blank lines of the section, so the
# subsequent record_sorter.rb run alphabetizes things in place.
def insert_into_section(readme_text, section_name, new_lines)
  lines = readme_text.split("\n", -1)
  start_idx = lines.index { |l| l == "#### #{section_name}" || l == "### #{section_name}" }
  return readme_text unless start_idx

  end_idx = ((start_idx + 1)..(lines.size - 1)).find { |j| lines[j].start_with?('#### ', '### ') } || lines.size
  insert_at = end_idx
  (end_idx - 1).downto(start_idx + 1) { |j| lines[j].strip.empty? ? (insert_at = j) : (break) }
  lines.insert(insert_at, *new_lines)
  lines.join("\n")
end

# ---------------------------------------------------------------------------
# Main

readme_repos, readme_names = index_readme(README_PATH)
aliases = File.exist?(ALIAS_PATH) ? (YAML.safe_load(File.read(ALIAS_PATH)) || {}) : {}

client = FCMarketplace::Client.new(cache_path: CACHE_PATH)
result = client.sync(readme_repos: readme_repos, readme_names: readme_names, aliases: aliases)

# Group unmatched apps by proposed README section.
by_section = Hash.new { |h, k| h[k] = [] }
result.unmatched.each do |r|
  section = propose_section(r['fc_categories'])
  desc = r['fc_description'].to_s.gsub(/\s+/, ' ').strip
  by_section[section] << "- [#{r['fc_title']}](https://github.com/#{r['owner_repo']}) - #{desc}"
end

# Apply README inserts.
text = File.read(README_PATH)
by_section.each { |section, lines| text = insert_into_section(text, section, lines) }
File.write(README_PATH, text)

# Alphabetize via the project's sorter (it reads ./README.md, so chdir).
if File.exist?(SORTER)
  Dir.chdir(ROOT) do
    system('ruby', SORTER) || warn('record_sorter.rb returned non-zero')
  end
end

# ---------------------------------------------------------------------------
# PR body

File.open(PR_BODY_PATH, 'w') do |io|
  io.puts 'Automated proposal of Frappe Cloud marketplace apps not yet listed.'
  io.puts
  io.puts '## Summary'
  io.puts
  io.puts '| | Count |'
  io.puts '|---|--:|'
  io.puts "| FC marketplace apps (published)      | #{result.app_count} |"
  io.puts "| Already in awesome-frappe            | #{result.matched.size} |"
  io.puts "| **Proposed additions in this PR**    | **#{result.unmatched.size}** |"
  io.puts "| No public GitHub URL on FC page      | #{result.no_github.size} |"
  io.puts "| Sitemap-only (drafts/unpublished)    | #{result.sitemap_only.size} |"
  io.puts
  io.puts '## Section breakdown'
  io.puts
  io.puts '| Section | Adds |'
  io.puts '|---|--:|'
  ordered = SECTION_ORDER + (by_section.keys - SECTION_ORDER)
  ordered.each do |section|
    next unless by_section.key?(section)
    io.puts "| #{section} | #{by_section[section].size} |"
  end
  io.puts
  io.puts '## How to use this PR'
  io.puts
  io.puts '- Review the diff section by section.'
  io.puts '- Delete any rows you don\'t want (the next sync will not re-propose deleted-then-merged apps because they\'ll have entered README; but rejected-without-merging will resurface next week — add an alias-map entry to suppress).'
  io.puts '- Merge when you\'re happy. The reconciliation workflow refreshes this branch each Monday.'
  unless result.no_github.empty?
    io.puts
    io.puts '## FC apps without a public GitHub URL (not added)'
    io.puts
    result.no_github.sort_by { |a| a['name'] }.first(40).each do |a|
      io.puts "- **#{a['title']}** (`#{a['name']}`)"
    end
    io.puts '- ...' if result.no_github.size > 40
  end
end

# Tiny stdout summary for human/workflow visibility.
warn "FC sync: #{result.matched.size} matched, #{result.unmatched.size} proposed " \
     "(#{by_section.size} sections), #{result.no_github.size} skipped (no GH)."
