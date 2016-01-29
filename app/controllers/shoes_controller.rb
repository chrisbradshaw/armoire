class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
      if @shoe.save
        flash[:success] = "Your shoe has been put in your closet!"
        redirect_to @shoe
      else
      render 'new'
    end
  end

  def update
    if @shoe.update(shoe_params)
      flash[:success] = "Your shoe has been updated!"
    else
      render 'new'
    end
  end

  def delete
    @shoe.destroy
    flash[:success] = "#{@shoe.name} is removed from your armoire."
  end

  private
  def shoe_params
    params.require(:shoe).permit(:name, :element, :style, :color, :occasion, :season, :worn)
  end

end