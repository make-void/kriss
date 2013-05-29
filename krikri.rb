path = File.expand_path "../", __FILE__
require "#{path}/config/env"
require 'sinatra'

require "#{path}/lib/moka"
include Moka

get '/' do
  regenerate_coffescripts
  haml :index
end

get '/pages/*' do |page|
  regenerate_coffescripts
  haml "pages/#{page}".to_sym
end

get '/zoom*' do |image|
  regenerate_coffescripts
  @image = image
  @name = File.basename("#{path}/public/#{image}", ".*").gsub(/_/, " ")
  @project = image.split("/")[2]
  haml :zoom
end


helpers do
  def back
    haml "elements/back".to_sym
  end

  def img_large(name)
    @path = request.path.split("/")[1..-1]
    @name = name
    haml "elements/img_large".to_sym
  end
end

