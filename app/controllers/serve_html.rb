require 'sinatra'
require 'haml'
require_relative '../../app/helpers/helper'

# This has the methods needed to dynamically create the view
class ServeHTML < Sinatra::Base
  if development?

    helpers Helper
    set :views, File.expand_path('../../views', __FILE__)

    get '/' do
      haml :'default.html'
    end

    get %r{/pathways/(\d{59})/(.*)} do |id, action|
      haml :'default.html'
    end

  else

    get '/' do
      send_file 'public/default.html'
    end

    get %r{/pathways/(\d{59})/(.*)} do |id, action|
      send_file 'public/default.html'
    end
  end
end