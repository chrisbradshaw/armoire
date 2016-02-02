class GarmentsController < ApplicationController
  def show
    @garment = Garment.find_by(id: params[:id])
  end

  def new
    @garment = Garment.new
  end

  def edit
  end

  def create
    @garment = Garment.new(garment_params)
    @garment.user = current_user
    if @garment.save
      flash[:success] = "You've added a garment to your Armoire."
      redirect_to @garment
    end
    # binding.pry
  end

  def update
    @garment.user_id = current_user.id
  end

  def destroy
    @garment = Garment.find_by(id: params[:id])

    @garment.destroy
    flash[:success] = "You've deleted a garment from your Armoire."
    redirect_to garments_path
  end

  private

  def garment_params
    params.require(:garment).permit(:name, :element, :style, :color, :occasion, :season, :worn, :user_id)
  end
end
