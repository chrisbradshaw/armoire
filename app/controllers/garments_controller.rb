class GarmentsController < ApplicationController
  def index
    @garments = Garments.all
  end

  def show
  end

  def new
    @garment = Garment.new
  end

  def edit
  end

  def create
    @garment = Garment.new(garment_params)

    if @garment.save
      flash[:success] = "You've added #{@garment[:name]} to your armoire."
      redirect_to @garment
    end
  end

  def update
  end

  def delete
    @garment.destroy
    flash[:success] = "You've deleted #{@garment[:name]} from your armoire."
  end

  private
  def garment_params
    params.require(:garment).permit(:name, :element, :style, :color, :occassion, :season, :worn)
  end

end
