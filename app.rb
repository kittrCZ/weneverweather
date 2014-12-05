require 'rubygems'
require 'bundler'

require 'sinatra/base'
require 'json'
require 'rest-client'

require_relative 'models/init'

class WheneverWeather < Sinatra::Base
enable :sessions

# CONSTANTS
IP_ADDRESS_API = "http://ip-api.com/json"
WEATHER_BY_CITY_API = "http://api.openweathermap.org/data/2.5/weather?q="

set :show_exceptions, false
set :title, "WheneverWeather"

before do
  headers 'Access-Control-Allow-Origin' => '*',
  'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

get '/' do
  erb :layout
end

get '/weather' do
  content_type :json
  get_weather(get_city_from_ip)
end

error do
  "sinatra error handler" 
end

not_found do
  erb :not_found
end

private

def get_city_from_ip
 begin
  api_result = JSON.parse RestClient.get(IP_ADDRESS_API)
  puts IpResult.new(api_result).inspect
  sanitize_city_name api_result["city"]
 rescue => e

 end
end

def get_weather(city_name)
  begin
    return RestClient.get WEATHER_BY_CITY_API + city_name
  rescue => e

  end
end

def sanitize_city_name city_name
  clean_name = city_name.downcase
  clean_name.gsub! ' ', '+'  
end

end

