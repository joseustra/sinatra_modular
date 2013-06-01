ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sass/plugin/rack'
require './settings'

Dir.glob('./app/controllers/*.rb') { |f| require f }
Dir.glob('./app/models/*.rb') { |f| require f }

configure do
  Sass::Plugin.options[:style] = :compressed
  Sass::Plugin.options[:css_location] = "./public/stylesheets"
  Sass::Plugin.options[:template_location] = "./assets/sass"

  use Sass::Plugin::Rack
  use Rack::Coffee, root: File.dirname(__FILE__), urls: '/assets/javascripts'
end

run Rack::URLMap.new({
  "/"    => HomeController
})
