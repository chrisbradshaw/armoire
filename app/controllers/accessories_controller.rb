class AccessoriesController < ApplicationController

<<<<<<< HEAD
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
        redirect_to @Accessory
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

  def delete
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to accessories_url}
      format.json { head :no_content }
    end
  end

   private


     def accessory_params
       params.require(:accessory).permit(:name, :element, :style, :color, :occasion, :season, :worn)
     end
# end
