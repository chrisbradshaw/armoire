class UsersController < ApplicationController
# include SessionsHelper
# before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    @user = current_user
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Armoire. Prepare to look amazing."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been taken in!"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # def correct_user?
    #   @user = User.find(params[:id])
    #   redirect_to(root_path) unless current_user?(@user)
    # end

end
