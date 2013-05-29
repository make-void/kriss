path = File.expand_path "../", __FILE__
PATH = path
require "#{path}/config/env"
require 'sinatra'

# require "#{path}/lib/moka"
# include Moka

get '/' do
  haml :index
end

get '/pages/*' do |page|
  haml "pages/#{page}".to_sym
end

get '/zoom*' do |image|
  @image = image
  @name = File.basename("#{PATH}/public/#{image}", ".*").gsub(/_/, " ")
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

