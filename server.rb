require 'bundler' ; Bundler.require
require 'sinatra/base'

configure { set :server, :puma }
set :bind, '0.0.0.0'

# set all the settings!
configure do
  # this is arguably not necessary... 'public'
  # folder is the static content location by default
  set :public_folder, File.join(File.dirname(__FILE__), 'views')
end
get '/' { redirect 'index.html' }
get '/index' { redirect '/' }
get '/main' { redirect '/' }
