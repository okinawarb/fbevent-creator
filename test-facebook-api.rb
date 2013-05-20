# -*- coding: utf-8 -*-
require 'time'
require 'yaml'
require 'koala'
require 'open-uri'
require 'active_support/time'
require 'active_support/core_ext'

@config = YAML.load_file(ARGV[0] || 'config.yml').with_indifferent_access

graph = Koala::Facebook::API.new(@config['access_token'])

p graph.get_connections('194735460599272', 'members')
exit
