path = File.expand_path "../", __FILE__
require "#{path}/config/env"
require 'sinatra'

require "#{path}/lib/moka"
include Moka

get '/' do
  regenerate_coffescripts
  haml :index
end

get '/main.css' do
  sass :main
end

