module Moka
  def regenerate_coffescripts
    files = %w{master}
    files.map do |file|
      `coffee -p public/js/coffee/#{file}.coffee  > public/js/#{file}.js`
    end
  end
end