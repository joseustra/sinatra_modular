ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sinatra/base'
require './settings'

Dir.glob('./app/controllers/*.rb') { |f| require f }
Dir.glob('./app/models/*.rb') { |f| require f }

run Rack::URLMap.new({
  "/" => HomeController,
  "/javascripts" => AssetsController,
  "/stylesheets" => AssetsController
})
