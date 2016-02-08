class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
   FORECAST_KEY = "52257016e380daa78bdba4b79225ab6e"
def index
  set_temperature
  render 'index'
end  

def set_temperature
   long = current_user.geocode.last
   lat = current_user.geocode.first
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
