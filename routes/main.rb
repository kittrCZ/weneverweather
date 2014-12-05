class WheneverWeather < Sinatra::Application
  get '/' do
    erb :layout
  end
end
