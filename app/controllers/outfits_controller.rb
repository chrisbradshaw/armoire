class OutfitsController < ApplicationController
  # outfits last only while they are on-screen should be created and shown but not saved.

  def new
    @outfit = Outfit.new
  end

  def destroy
    @outfit = Outfit.find_by(id: params[:id])
    @outfit.destroy
    flash[:success] = "Let's find you another outfit."
    render 'new'
   end

  def show
    @outfit = Outfit.find_by(id: params[:id])
  end

  def random
    @random_accessory = Accessory.where(user_id: current_user.id).random_accessory
    @random_garment = Garment.where(user_id: current_user.id).random_garment
    @random_shoe = Shoe.where(user_id: current_user.id).random_shoe
  end

  def create
    @outfit = Outfit.new(outfits_params)
    @outfit.user_id = current_user.id
    if @outfit.save
      flash[:success] = 'Get dressed, not stressed!'
      redirect_to @outfit
    else
      flash[:error] = @outfit.errors.full_messages.join("\n")
      render 'new'
    end
  end

  def index
    @outfits = Outfit.where(user_id: current_user.id, action: 1)
  end

  def pending
    @outfits = Outfit.where(user_id: current_user.id, action: 0)
  end

  def status
    @outfit = Outfit.find(params[:id])
    @outfit.update(action: Outfit.actions[params[:status]])

    redirect_to outfits_path
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.name = params[:name]
    @outfit.save
    redirect_to outfit_path(@outfit), notice: 'Outfit name updated successfully.'
  end

  private

  def outfits_params
    params.require(:outfit).permit(:garment_id, :shoe_id, :accessory_id)
  end
end
