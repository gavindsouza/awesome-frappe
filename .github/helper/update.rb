#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'

if __FILE__ == $PROGRAM_NAME
  workspace = ENV['GITHUB_WORKSPACE']
  awesome_file = "#{workspace}/README.md"

  file_entries_by_line = File.readlines(awesome_file)
  user_submission = JSON.parse(ENV['submission_entry'] || '{}')

  # Validate submission data
  if user_submission.empty? || !user_submission['category'] || !user_submission['app_or_resource_name']
    puts "Error: Invalid or empty submission data"
    exit(1)
  end

  # add user submission to affirmations file
  category_index = file_entries_by_line.index("### #{user_submission['category']}\n")

  unless category_index
    puts "Error: Category '#{user_submission['category']}' not found in README"
    exit(1)
  end

  insert_at_index = category_index + 1

  sub_category = user_submission['sub_category']
  # Only search for sub_category if it's not nil, empty, or "None"
  if sub_category && !sub_category.empty? && sub_category != "None"
    # Search for sub_category after the category_index
    sub_category_index = file_entries_by_line[category_index..-1].index("#### #{sub_category}\n")
    insert_at_index = category_index + sub_category_index + 1 if sub_category_index
  end

  new_entry = "- [#{user_submission['app_or_resource_name']}]" \
              "(#{user_submission['app_or_resource_url']}) - " \
              "#{user_submission['app_or_resource_description']}\n"

  file_entries_by_line.insert(insert_at_index, new_entry)

  # update affirmations file
  File.write(awesome_file, file_entries_by_line.join)

  puts "Updated #{awesome_file} with #{user_submission}"
end
