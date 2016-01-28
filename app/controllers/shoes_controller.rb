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
    respond_to do |format|
      format.html { redirect_to shoes_url}
      format.json { head :no_content }
    end
  end

  private
  def params
    params.require(:shoe).permit(:name, :element, :style, :color, :occasion, :season, :worn)
  end

end