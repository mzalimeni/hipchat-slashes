require 'rubygems'
require 'bundler'

Bundler.require

# Add Rack middleware for parsing requests, etc.
use ::Rack::PostBodyContentTypeParser

require './app'
run Sinatra::Application

