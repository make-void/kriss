require_relative "config/env"

# monkeypatches
class String
  def humanize
    gsub(/_+/, ' ')
  end
end

# Kriss app

set :root, PATH

get '/' do
  haml :index
end

get '/pages/*' do |page|
  # haml "pages/#{page}".to_sym
  @page = page
  haml :page
end

get '/zoom/*' do |image|
  @name = File.basename("#{PATH}/public/#{image}", ".*").gsub(/_/, " ")
  @image = "/#{image}"
  @project = image.split("/")[1]
  haml :zoom
end

get '/zoom2' do
  @image = params[:image]
  @name = File.basename("#{PATH}/public/#{@image}", ".*").split("_")[1..-1].join(" ").gsub(/kristina canessa/, '').strip
  @project = @image.split("/")[2]
  haml :zoom2
end

# ---

helpers do
  def dirs_all
    Dir.glob("#{PATH}/public/images/*").map{ |dir| File.basename dir }
  end

  def dirs
    dirs_all - ["_menu"]
  end

  def photos(dir)
    files = Dir.glob("#{PATH}/public/images/#{dir}/*.jpg").map{ |dir| File.basename dir, ".jpg" }
    files.map{ |photo| "/images/#{dir}/#{photo}.jpg" }.sort
  end

  def back
    haml "elements/back".to_sym
  end

  def img_large(name)
    @path = request.path.split("/")[1..-1]
    @name = name
    haml "elements/img_large".to_sym
  end
end
