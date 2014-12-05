require 'sprockets'

root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'vendor/javascripts'
  environment.append_path 'vendor/stylesheets'
  environment.append_path 'test' if (WheneverWeather.development? || WheneverWeather.test?)
  run environment
end

run WheneverWeather.new
