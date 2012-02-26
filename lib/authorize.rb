#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "oauth"
require "yaml"

config = YAML.load_file("./config.yaml")["tumblr"]
consumer_key = config["consumer_key"]
consumer_secret = config["consumer_secret"]

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, { :site => "http://www.tumblr.com", :http_method => :get })
request_token = consumer.get_request_token
puts "open " + request_token.authorize_url

puts "input verifier"
verifier = gets

puts "oauth verifier: " + verifier
access_token = request_token.get_access_token( :oauth_verifier => verifier )

puts "consumer_key: " + consumer_key
puts "consumer_secret: " + consumer_secret
puts "oauth_token: " + access_token.oauth_token
puts "oauth_token_secret: " + access_token.oauth_token_secret
