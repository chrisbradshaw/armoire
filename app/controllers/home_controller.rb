class HomeController < ApplicationController
  def index
    render 'index'
  end

  def help
    render 'help'
  end

  def about
    render 'help'
  end
end
