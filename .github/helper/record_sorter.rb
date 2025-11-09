#!/usr/bin/env ruby
# frozen_string_literal: true

SECTIONS_TO_SORT = ["Apps", "Developer Tooling", "Deployment Tools", "Other Clients"]
NEWLINE = "\n"

def sort_section(lines)
  sorted_lines = []
  heading_buffer = []

  lines.each do |line|
    is_heading = line.start_with?("#")
    is_list = line.start_with?("-")

    next if line == NEWLINE

    if is_heading
      heading_buffer.sort_by! { |l| l.downcase }
      sorted_lines.concat(heading_buffer + [NEWLINE])
      sorted_lines << line
      heading_buffer = [NEWLINE]
    elsif is_list
      heading_buffer << line
    else
      sorted_lines << NEWLINE unless sorted_lines.last == NEWLINE
      sorted_lines << line
    end
  end

  if !heading_buffer.empty?
    heading_buffer.sort_by! { |l| l.downcase }
    sorted_lines.concat(heading_buffer + [NEWLINE])
  end

  sorted_lines
end

if __FILE__ == $PROGRAM_NAME
  readme = File.readlines("README.md")
  readme_sorted = readme.dup

  SECTIONS_TO_SORT.each do |section|
    section_start = readme_sorted.index("### #{section}\n")
    next unless section_start

    section_end = (section_start + 1...readme_sorted.length).find { |i| readme_sorted[i].start_with?("### ") }
    section_end ||= readme_sorted.length

    readme_sorted[section_start - 1...section_end] = sort_section(readme_sorted[section_start...section_end])
  end

  if readme != readme_sorted
    File.write("README.md", readme_sorted.join)
  end
end
