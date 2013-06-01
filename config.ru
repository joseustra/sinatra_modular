require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sass/plugin/rack'
require './settings'

Dir.glob('./app/controllers/*.rb') { |f| require f }
Dir.glob('./app/models/*.rb') { |f| require f }

configure do
  Sass::Plugin.options[:style] = :compressed
  Sass::Plugin.options[:css_location] = "./public/stylesheets"
  Sass::Plugin.options[:template_location] = "./assets/sass"

  use Sass::Plugin::Rack
  use Rack::Coffee, root: 'public', urls: '/javascripts'
end

run Rack::URLMap.new({
  "/"    => HomeController
})
