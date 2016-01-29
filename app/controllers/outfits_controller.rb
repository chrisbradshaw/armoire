class OutfitsController < ApplicationController

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

end
