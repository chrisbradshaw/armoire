
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
      if @accessory.save
        flash[:success] = "Your Accessory has been added to your Armoire!"
        redirect_to @accessory
      else
      render 'new'
    end
  end

  def update
    if @accessory.update(accessory_params)
      flash[:success] = "Your Accessory has been updated!"
    else
      render 'new'
    end
  end

  def destroy

    @accessory = Accessory.find_by(params[:id])
    @accessory.destroy
    flash[:success] = "You've deleted an accessory from your Armoire."
    redirect_to accessories_path
  end

   private


     def accessory_params
       params.require(:accessory).permit(:name, :element, :style, :color, :occasion, :season, :worn)
     end
end
