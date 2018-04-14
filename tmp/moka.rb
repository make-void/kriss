# usage:
#
# ruby lib/moka.rb

module Moka
  def regenerate_coffescripts!
    return if ENV["RACK_ENV"] == "production"
    files = %w{master}
    files.map do |file|
      `coffee -p public/js/coffee/#{file}.coffee  > public/js/#{file}.js`
    end
  end
end

if $0 == __FILE__
  Moka.regenerate_coffescripts!
end
