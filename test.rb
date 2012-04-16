# -*- coding: utf-8 -*-
require 'json'
require 'time'
require 'koala'
require 'open-uri'
require 'active_support/time'

open('config.json') {|f|
  @config = JSON.parse f.read
}

graph = Koala::Facebook::API.new(@config['access_token'])

p graph.get_connections('194735460599272', 'members')
exit
