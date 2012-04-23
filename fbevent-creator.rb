# -*- coding: utf-8 -*-
require 'pp'
require 'json'
require 'time'
require 'koala'
require 'open-uri'
require 'active_support/time'

open('config.json', 'r:utf-8') {|f|
  @config = JSON.parse f.read
}

graph = Koala::Facebook::API.new(@config['access_token'])
picture = Koala::UploadableIO.new(open(@config['picture_uri']).path, 'image')

params = {
  :picture => picture,
  :name => @config['name'] % @config['times'],
  :description => @config['description'],
  :location => @config['location'],
  :start_time => Time.parse(@config['start_time']),
  :page_id => @config['group_id']
}

event = graph.put_connections(@config['group_id'], 'events', params)

# update information
@config['times'] = @config['times'] + 1
@config['start_time'] = 7.days.since(Time.parse(@config['start_time']))

open('config.json', 'w') {|f|
  f.puts JSON.pretty_generate @config
}