require 'cgi'

module Jekyll
  module DescriptionFilter
    def enrich_description(description)
      return '' if description.nil? || description.empty?

      enriched = description.dup

      # Convert markdown links [text](url) to HTML
      # Handle italic wrapped links like _[text](url)_ by preserving the emphasis
      enriched.gsub!(/_\[([^\]]+)\]\(([^\)]+)\)_/) do
        text = CGI.escapeHTML($1)
        url = CGI.escapeHTML($2)
        "<em><a href=\"#{url}\" target=\"_blank\" rel=\"noopener noreferrer\">#{text}</a></em>"
      end

      # Handle nested brackets like [[text](url)] - keep the inner brackets visible
      enriched.gsub!(/\[\[([^\]]+)\]\(([^\)]+)\)\]/) do
        text = CGI.escapeHTML($1)
        url = CGI.escapeHTML($2)
        "[<a href=\"#{url}\" target=\"_blank\" rel=\"noopener noreferrer\">#{text}</a>]"
      end

      # Then handle normal [text](url)
      enriched.gsub!(/\[([^\]]+)\]\(([^\)]+)\)/) do
        text = CGI.escapeHTML($1)
        url = CGI.escapeHTML($2)
        "<a href=\"#{url}\" target=\"_blank\" rel=\"noopener noreferrer\">#{text}</a>"
      end

      # Convert markdown italics _text_ to HTML <em>
      enriched.gsub!(/_([^_]+)_/) do
        text = CGI.escapeHTML($1)
        "<em>#{text}</em>"
      end

      # Convert @username to GitHub profile links
      # Only match @username when not already inside an HTML tag
      enriched.gsub!(/@([a-zA-Z0-9_-]+)(?![^<]*>)/) do
        username = $1
        "<a href=\"https://github.com/#{username}\" target=\"_blank\" rel=\"noopener noreferrer\">@#{username}</a>"
      end

      enriched
    end
  end
end

Liquid::Template.register_filter(Jekyll::DescriptionFilter)
