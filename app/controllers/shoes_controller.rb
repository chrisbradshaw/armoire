class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
  end

  def new
    @shoe = Shoe.new
  end

  def show
    @shoe = Shoe.find(params[:id])
  end


  def create
    @shoe = Shoe.new(shoe_params)
      if @shoe.save
        flash[:success] = "Your shoe added to your Armoire!"
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
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.destroy
    flash[:success] = "#{@shoe.name} is removed from your Armoire."
    redirect_to shoes_path
  end

  private
  def shoe_params
    params.require(:shoe).permit(:name, :element, :style, :color, :occasion, :season, :worn)
  end

end