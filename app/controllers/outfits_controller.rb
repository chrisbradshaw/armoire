class OutfitsController < ApplicationController

  #outfits last only while they are on-screen should be created and shown but not saved. 
  

  def new
    @outfit = Outfit.new(user_id: current_user.id)
    outfit = Outfit.where(user_id: current_user.id).order('random()').first
    
    @shoes=Shoe.all.where(user_id: current_user.id)
    @accessories= Accessory.all.where(user_id: current_user.id)
    @garments= Garment.all.where(user_id: current_user.id)
  end


  def destroy
    @outfit.destroy
    flash[:success] = "Let's find you another outfit."
    render 'new'
  end


  def show
    @outfit = Outfit.find(params[:id])
  end

  def create
    @outfit = Outfit.new(outfits_params)
    @outfit.user_id = current_user.id
      if @outfit.save
        flash[:success] = "Get dressed, not stressed!"
        redirect_to @outfit
      else
    outfit = Outfit.where(user_id: current_user.id).order('random()').first
     @shoes = [outfit.shoe]
        @accessories= [outfit.accessory]
     @garments = [outfit.garment]
      render 'new'
       # 'Need to send this undressed person somewhere'
    end
  end

  private
  def outfits_params
    params.require(:outfit).permit(:garment_id, :shoe_id, :accessory_id)

  end
end