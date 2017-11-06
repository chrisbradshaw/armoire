# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # should put key in a .env file

  FORECAST_KEY = '52257016e380daa78bdba4b79225ab6e'.freeze
  DEFAULT_LAT =  '40.74'
  DEFAULT_LONG = '-73.98'

  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_temperature

  protected

  # could put into a background job using Resque
def set_temperature
  if current_user.present?
    geocode = current_user.geocode
    if geocode.present?
      lat = geocode.first
      long = geocode.last
    else
      lat = DEFAULT_LAT
      long = DEFAULT_LONG
    end



      url = "https://api.forecast.io/forecast/#{FORECAST_KEY}/#{long},#{lat}"
      results = JSON.parse(open(url).read)
      @temperature = results['currently']['temperature']
      @summary = results['currently']['summary']
  end
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }

  end
end
