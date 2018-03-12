#!/usr/bin/env rake
# coding: utf-8
require 'sprockets'
require 'haml'
require 'json'
require 'yui/compressor'
require 'uglifier'
require 'rake/sprocketstask'
require './app/models/load_model'
require './app/helpers/helper'

# This deals with the javascript and css
Rake::SprocketsTask.new do |t|
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'app/assets/javascripts'
  sprockets.append_path 'app/assets/stylesheets'
  sprockets.append_path 'app/assets/vendors'

  sprockets.context_class.class_eval do
    include Helper
  end

  sprockets.css_compressor = YUI::CssCompressor.new
  sprockets.js_compressor  = Uglifier.new(mangle: true)

  t.environment = sprockets
  t.output      = "./public/assets"
  t.assets      = %w( application.js application.css )
end

manifest = './public/assets/manifest.json'
file manifest => ['assets']  

desc "Compiles changes to app/views/default.html.haml into public/default.html and adds links it to the latest versions of application.cs and application.js"
task 'html' => [manifest] do 

  class Context
    include Helper
  end

  context = Context.new

  # We need to figure out the filename of the latest javascript and css
  context.assets = JSON.parse(IO.readlines(manifest).join)['assets']

  input = IO.readlines('./app/views/default.html.haml').join
  File.open('./public/default.html','w') do |f|
    f.puts Haml::Engine.new(input).render(context)
  end
end


