require 'yaml'

module Jekyll
  class ReadmeParser < Generator
    safe true
    priority :high

    def generate(site)
      readme_path = File.join(site.source, 'README.md')
      return unless File.exist?(readme_path)

      content = File.read(readme_path)
      data = parse_readme(content)

      # Make the parsed data available to templates
      site.data['projects'] = data
    end

    private

    def parse_readme(content)
      lines = content.split("\n")
      categories = []
      current_category = nil
      current_subcategory = nil

      lines.each do |line|
        # Main category (### Apps, ### Developer Tooling, etc.)
        if line.match(/^### (.+)$/)
          category_name = $1.strip

          # Skip certain sections
          next if category_name == 'Apps' # We'll handle it via subcategories

          current_category = {
            'name' => category_name,
            'id' => slugify(category_name),
            'subcategories' => [],
            'items' => []
          }
          categories << current_category
          current_subcategory = nil

        # Subcategory (#### Business Apps, etc.)
        elsif line.match(/^#### (.+)$/)
          subcategory_name = $1.strip

          # Create the Apps category if it doesn't exist
          if current_category.nil? || current_category['name'] == 'Apps'
            if categories.none? { |c| c['name'] == 'Apps' }
              current_category = {
                'name' => 'Apps',
                'id' => 'apps',
                'description' => 'Apps that showcase the power of the Frappe Framework',
                'subcategories' => [],
                'items' => []
              }
              categories << current_category
            else
              current_category = categories.find { |c| c['name'] == 'Apps' }
            end
          end

          current_subcategory = {
            'name' => subcategory_name,
            'id' => slugify(subcategory_name),
            'items' => []
          }
          current_category['subcategories'] << current_subcategory

        # Project item (- [Name](url) - Description)
        elsif line.match(/^- \[(.+?)\]\((.+?)\) - (.+)$/)
          name = $1.strip
          url = $2.strip
          description = $3.strip

          item = {
            'name' => name,
            'url' => url,
            'description' => description
          }

          if current_subcategory
            current_subcategory['items'] << item
          elsif current_category
            current_category['items'] << item
          end
        # Category description (line starting with _ after a heading)
        elsif line.match(/^_(.+)_$/) && current_category && current_category['items'].empty? && current_category['subcategories'].empty?
          current_category['description'] = $1.strip
        end
      end

      # Add emoji icons for categories
      add_category_icons(categories)

      categories
    end

    def add_category_icons(categories)
      icons = {
        'Apps' => '🚀',
        'Developer Tooling' => '🛠️',
        'Other Tooling' => '🔧',
        'Deployment Tools' => '☁️',
        'Resources' => '📚',
        'Hosting' => '🌐'
      }

      categories.each do |category|
        category['icon'] = icons[category['name']] || '📦'
      end
    end

    def slugify(text)
      text.downcase.gsub(/[^\w\s-]/, '').gsub(/[\s_]+/, '-').gsub(/^-+|-+$/, '')
    end
  end
end
