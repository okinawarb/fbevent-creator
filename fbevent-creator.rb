#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
ENV['TZ'] = 'America/Los_Angeles'

require 'pp'
require 'yaml'
require 'active_support/core_ext'
require 'twitter'
require 'koala'
require 'open-uri'

# Heroku Scheduler Setting: run this script on Sunday
exit if not Time.now.sunday?
fbevent_base_url = "http://www.facebook.com/events"

@config = YAML.load_file(ARGV[0] || 'config.yml').with_indifferent_access

def next_name(name)
  name.force_encoding('ASCII-8BIT') =~ @config[:name]
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

  # create facebook event for a group w/ given information
  event = graph.put_connections(@config[:group_id], 'events', params)

  ## NOTE: You can announce you've created the facebook event, if you want.
  ##       To do it, set your Twitter API Token/Key to `config.yml`.
  #twitter = Twitter::Client.new(@config[:twitter])
  #twitter.update "#{name} is open! Come and join us! #{fbevent_base_url}/#{event['id']}"

rescue Koala::Facebook::APIError => e
  ## NOTE: Token Expiration Notifier via Twitter
  #twitter = Twitter::Client.new(@config[:twitter])
  #twitter.update "@yasulab The Facebook API token of your fbevent-creator seems to be expired. Check out the log.

  # print the error
  pp e
end
