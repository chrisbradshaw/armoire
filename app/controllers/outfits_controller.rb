class OutfitsController < ApplicationController

  #outfits last only while they are on-screen should be created and shown but not saved. 
  
  def index

    @outfits = Outfit.all
    @shoes = Shoe.all
  end

  def new
    @outfit = Outfit.new(outfit_params)
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
    @outfit = Outfit.new(outfit_params)
      if @outfit
        flash[:success] = "Get dressed, not stressed!"
        redirect_to @outfit
      else
       'Need to send this undressed person somewhere'
    end
  end

  private
  def outfits_params
  end
end
