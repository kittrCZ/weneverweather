require 'rubygems'
require 'bundler'
require 'sinatra'
require 'json'
require 'rest-client'

class WheneverWeather < Sinatra::Base

# CONSTANTS
IP_ADDRESS_API = "http://ip-api.com/json"
WEATHER_BY_CITY_API = "http://api.openweathermap.org/data/2.5/weather?q="

set :show_exceptions, false

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
  ip_address_info = JSON.parse RestClient.get(IP_ADDRESS_API)
  sanitize_city_name ip_address_info["city"]
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

