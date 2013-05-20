# -*- coding: utf-8 -*-

require 'yaml'
require 'twitter'
require 'open-uri'
require 'active_support/core_ext'

@config = YAML.load_file(ARGV[0] || 'config.yml').with_indifferent_access
twitter = Twitter::Client.new(@config[:twitter])

# Twitter Test: Show Timeline
twitter.home_timeline.each do |tw|
  puts tw['text']
end
