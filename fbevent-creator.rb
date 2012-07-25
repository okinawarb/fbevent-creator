#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
ENV['TZ'] = 'America/Los_Angeles'

require 'pp'
require 'yaml'
require 'active_support/core_ext'
require 'twitter'
require 'koala'
require 'open-uri'

exit if not Time.now.sunday?

@config = YAML.load_file(ARGV[0] || 'config.yml').with_indifferent_access

def next_name(name)
  name =~ @config[:name]
  eval @config[:next_name]
end

begin
  graph = Koala::Facebook::API.new(@config[:access_token])

  picture = Koala::UploadableIO.new(open(@config[:picture_uri]).path, 'image')
  recent_event = graph.get_connections(@config[:group_id], 'events').first
  name = next_name(recent_event['name'])
  start_time = Time.parse(recent_event['start_time'])

  params = {
    picture:     picture,
    name:        name,
    description: @config[:description],
    location:    @config[:location],
    start_time:  start_time + 1.week,
    page_id:     @config[:group_id],
  }

  graph.put_connections(@config[:group_id], 'events', params)
rescue Koala::Facebook::APIError => e
  twitter = Twitter::Client.new(@config[:twitter])
  twitter.update @config[:token_expire_notification]

  pp e
end
