class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
   
  def index
  end

  def help
    render 'help'
  end

  def about
    render 'about'
  end
end