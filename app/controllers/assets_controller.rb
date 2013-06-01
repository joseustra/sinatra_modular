require 'sass/plugin/rack'
class AssetsController < Sinatra::Base
  
  get '/application.js' do
    coffee "/assets/coffee/application".to_sym
  end

  # get '/application.css' do
  #   scss "/assets/scss/application".to_sym
  # end

  get "/*.css" do |path|
    scss :"assets/scss/#{path}"
  end
end
