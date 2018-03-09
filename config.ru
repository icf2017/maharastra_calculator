# encoding: utf-8
require 'rubygems'
require 'bundler'
Bundler.setup

require './src/serve_model_data'
require './src/serve_html'

ENV['RACK_ENV'] = ENV['RAILS_ENV'] if ENV['RAILS_ENV']

map '/' do
  use Rack::CommonLogger
  map '/assets' do
    require 'sprockets'
    require 'app/helpers/helper'
    environment = Sprockets::Environment.new

    environment.append_path 'app/assets/javascripts'
    environment.append_path 'app/assets/stylesheets'
    environment.append_path 'public/assets'
    environment.append_path 'app/assets/vendors'

    environment.context_class.class_eval do 
      include Helper
    end

    run environment
  end
  use ServeModelData
  run ServeHTML
end
