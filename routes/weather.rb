class WheneverWeather < Sinatra::Application

get '/weather' do
  content_type :json
  get_weather(get_city_from_ip)
end

def get_city_from_ip
 begin
  IpResult.new(JSON.parse RestClient.get(IP_ADDRESS_API))
 rescue => e

 end
end

def get_weather(ip_result)
  begin
    return RestClient.get WEATHER_BY_CITY_API + sanitize_city_name(ip_result.city)
  rescue => e

  end
end

def sanitize_city_name city_name
  clean_name = city_name.downcase
  clean_name.gsub! ' ', '+'
end


end
