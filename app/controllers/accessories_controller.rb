
class AccessoriesController < ApplicationController
  def index
    @accessories = Accessory.all
  end

  def new
    @accessory = Accessory.new
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

  def create
    @accessory = Accessory.new(accessory_params)
    @accessory.user_id = current_user.id
    if @accessory.save
      flash[:success] = 'Your Accessory has been added to your Armoire!'
      redirect_to @accessory
    else
      render 'new'
  end
  end

  def edit
    @accessory = Accessory.find(params[:id])
  end

  def update
    @accessory = Accessory.find(params[:id])
    @accessory.user_id = current_user.id
    if @accessory.update(accessory_params)
      flash[:success] = 'Your accessory has been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @accessory = Accessory.find_by(id: params[:id])
    @accessory.destroy
    flash[:success] = "#{@accessory.name} is removed from your Armoire."
    redirect_to accessories_path
  end

  private

  def accessory_params
    params.require(:accessory).permit(:user_id, :name, :element, :style, :color, :occasion, :season, :worn, :image)
  end
end
