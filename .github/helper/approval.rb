#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

ISSUE_NUMBER = ENV['ISSUE_NUMBER'] # "1200"
GITHUB_REPOSITORY = ENV['GITHUB_REPOSITORY'] # "octocat/Hello-World"
GITHUB_TOKEN = ENV['GITHUB_TOKEN'] # "1234567890"

def fetch_json(url, headers = {})
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  headers.each { |key, value| request[key] = value }

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(request)
  end

  JSON.parse(response.body)
end

def check_collaborator(url, token)
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  request['Authorization'] = "token #{token}"

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(request)
  end

  response.is_a?(Net::HTTPSuccess)
end

if __FILE__ == $PROGRAM_NAME
  endpoint_url = "https://api.github.com/repos/#{GITHUB_REPOSITORY}/issues/#{ISSUE_NUMBER}/comments"
  collaborator_url = "https://api.github.com/repos/#{GITHUB_REPOSITORY}/collaborators/%{username}"
  issue_comments = fetch_json(endpoint_url)

  issue_comments.each do |comment|
    username = comment['user']['login']
    comment_body = comment['body']

    next unless comment_body.include?('LGTM')

    puts "LGTM found by #{username}"

    is_collaborator = check_collaborator(
      collaborator_url % { username: username },
      GITHUB_TOKEN
    )

    if is_collaborator
      puts "#{username} is a collaborator and issue is approved"
      exit(0) # exit with success code if a collaborator has dropped a LGTM comment
    end
  end

  puts "No one has dropped a LGTM comment"
  exit(1) # exit with error code if no collaborator has approved the affirmation
end
