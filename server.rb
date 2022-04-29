require 'bundler' ; Bundler.require
# require 'sinatra'
require 'sinatra/base'
# require 'puma'

configure { set :server, :puma }
set :bind, '0.0.0.0'

# class Web < Sinatra::Base

  # set all the settings!
  configure do
    # this is arguably not necessary... 'public'
    # folder is the static content location by default
    set :public_folder, File.join(File.dirname(__FILE__), 'views')
    # set :public_folder, 'views'

    # optionally configure Cache-Control headers on responses
    # set :static_cache_control, [:public, :max_age => 300]

    # if using mime types not known to Sinatra, uncomment and
    # configure here (by file extension)
    # mime_type :foo, 'text/foo'
  end
  get '/' do
    redirect 'index.html'
  end

  get '/index' do
    redirect '/'
  end

  get '/main' do
    redirect '/'
  end
# end
