class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'You may not lack style, but you do lack the proper log in information. Try again.'
      render 'new'
    end
  end
 
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
 
 end