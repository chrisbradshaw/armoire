class GarmentsController < ApplicationController
  def show
    @garment = Garment.find_by(id: params[:id])
  end

  def new
    @garment = Garment.new
  end

  def edit
    @garment = Garment.find(params[:id])
  end

  def create
    @garment = Garment.new(garment_params)
    @garment.user = current_user
    if @garment.save
      flash[:success] = "You've added a garment to your Armoire."
      redirect_to @garment
    end
  end

  def update
    @garment = Garment.find(params[:id])
    @garment.user_id = current_user.id
    if @garment.update(garment_params)
      flash[:success] = 'Your garment has been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @garment = Garment.find_by(id: params[:id])

    @garment.destroy
    flash[:success] = "You've deleted a garment from your Armoire."
    redirect_to garments_path
  end

  private

  def garment_params
    params.require(:garment).permit(:user_id, :name, :element, :style, :color, :occasion, :season, :worn, :image)
  end
end
