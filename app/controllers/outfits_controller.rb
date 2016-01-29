class OutfitsController < ApplicationController

  #outfits last only while they are on-screen should be created and shown but not saved. 
  def new
    @outfit = Outfit.new(outfit_params)
  end


  def destroy
    @outfit.destroy
    flash[:success] = "Let's find you another outfit."
    render 'new'
  end

  private
  def outfits_params
  end

end
