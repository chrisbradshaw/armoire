class ShoesController < ApplicationController
  def new
    @shoe = Shoe.new
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user_id = current_user.id
    if @shoe.save
      flash[:success] = 'Your shoe added to your Armoire!'
      redirect_to @shoe
    else
      render 'new'
  end
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.user_id = current_user.id
    if @shoe.update(shoe_params)
      flash[:success] = 'Your shoe has been updated!'
    else
      render 'new'
    end
  end

  def destroy
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.destroy
    flash[:success] = "#{@shoe.name} is removed from your Armoire."
    redirect_to shoes_path
  end

  private

  def shoe_params
    params.require(:shoe).permit(:user_id, :name, :element, :style, :color, :occasion, :season, :worn, :image)
  end
end
