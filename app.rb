require 'rubygems'
require 'bundler'

require 'sinatra'
require 'json'
require 'rest-client'

class WheneverWeather < Sinatra::Application
  # Based on http://stackoverflow.com/questions/18044627/sinatra-1-4-3-use-racksessioncookie-warning
  set :sessions, key: 'N&wedhSDF', domain: "localhost", path: '/',  expire_after: 14400, secret: '*&(^B234'

  # CONSTANTS
  IP_ADDRESS_API = "http://ip-api.com/json"
  WEATHER_BY_CITY_API = "http://api.openweathermap.org/data/2.5/weather?q="

  set :show_exceptions, false
  set :title, "WheneverWeather"

  before do
    headers 'Access-Control-Allow-Origin' => '*',
    'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
  end

  error do
    "sinatra error handler" 
  end

  not_found do
    erb :not_found
  end

end

require_relative 'models/init'
require_relative 'routes/init'
