ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sinatra/base'
require './routes'
require './settings'

Dir.glob('./app/controllers/*.rb') { |f| require f }
Dir.glob('./app/models/*.rb') { |f| require f }

run Rack::URLMap.new(Routes.new.all)
