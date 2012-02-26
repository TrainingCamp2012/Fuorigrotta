#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "tumblife"
require "yaml"
require "ap"

t_config = YAML.load_file("./config.yaml")["tumblr"]
Tumblife.configure do |config|
  config.consumer_key = t_config["consumer_key"]
  config.consumer_secret = t_config["consumer_secret"]
  config.oauth_token = t_config["oauth_token"]
  config.oauth_token_secret = t_config["oauth_token_secret"]
end

client = Tumblife.client

puts "name of blog: " + client.info("inut.tumblr.com").blog.name

client.posts("inut.tumblr.com").each do |post|
  ap post  
end
