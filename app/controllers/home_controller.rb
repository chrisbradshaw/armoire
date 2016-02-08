class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
   FORECAST_KEY = "52257016e380daa78bdba4b79225ab6e"
def index
  if current_user
  set_temperature
end
  render 'index'
end  

def set_temperature

  geocode = current_user.geocode
  lat, long = geocode.first, geocode.last
   url = "https://api.forecast.io/forecast/#{FORECAST_KEY}/#{long},#{lat}"
   results = JSON.parse(open(url).read)
   @temperature = results['currently']['temperature']
   @summary = results['currently']['summary']
 end

  def help
    render 'help'
  end

  def about
    render 'about'
  end
end
