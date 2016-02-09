class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]

  def show
    @outfits = Outfit.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user = current_user
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Armoire. Prepare to look amazing.'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'Your profile has been taken in!'
    else
      render 'new'
    end
  end

  def index
    @users = User.where('id != ?', current_user.id)
  end

  def follow
    if current_user.follow(@user)
      redirect_to users_path, notice: "You have successfully followed #{@user.username}"
    else
      redirect_to users_path, alert: "You are already following #{@user.username}"
    end
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to users_path, notice: "You have unfollowed #{@user.username}"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

