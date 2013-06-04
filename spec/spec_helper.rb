ENV["RACK_ENV"] = "test"
require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'rack/test'
require './settings'
require './routes'

Dir.glob('./app/controllers/*.rb') { |f| require f }
Dir.glob('./app/models/*.rb') { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

def app
  Rack::URLMap.new(Routes.new.all)
end
