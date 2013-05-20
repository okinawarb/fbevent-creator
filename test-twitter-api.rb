# -*- coding: utf-8 -*-
require 'pp'
require 'json'
require 'time'
require 'koala'
require 'twitter'
require 'open-uri'
require 'active_support/time'

# load config.json
open('config.json') {|f|
  @config = JSON.parse f.read
}

# tweet
Twitter.configure do |config|
  config.consumer_key = @config['twitter_consumer_key']
  config.consumer_secret = @config['twitter_consumer_secret']
  config.oauth_token = @config['twitter_access_token']
  config.oauth_token_secret = @config['twitter_token_secret']
end

# show my timeline
Twitter.home_timeline.each do |tw|
  puts tw['text']
end

