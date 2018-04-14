path = File.expand_path "../", __FILE__
require "#{path}/krikri"

run Sinatra::Application
