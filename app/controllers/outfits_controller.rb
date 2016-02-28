class OutfitsController < ApplicationController
  # outfits last only while they are on-screen should be created and shown but not saved.

  def new
    @outfit = Outfit.new
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    flash[:success] = "Let's find you another outfit."
    render 'new'
 end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def random
    # no longer on site

    @random_accessory = Accessory.random_accessory(current_user.id)
    @random_garment = Garment.random_garment(current_user.id)
    @random_shoe = Shoe.random_shoe(current_user.id)
  end

  def seasonal
    @seasonal_accessory = Outfit.get_seasonal_outfit(@temperature, current_user)[0]
    @seasonal_garment = Outfit.get_seasonal_outfit(@temperature, current_user)[1]
    @seasonal_shoe = Outfit.get_seasonal_outfit(@temperature, current_user)[2]
  end

  def create
    @outfit = Outfit.new(outfits_params)
    @outfit.user_id = current_user.id
    if @outfit.save
      flash[:success] = 'Get dressed, not stressed!'
      redirect_to @outfit
    else
      flash[:error] = @outfit.errors.full_messages.join("\n")
      render 'new'
    end
  end

  def index
    # if params[:other_user_id].present?
    #   @outfits = Outfit.where(user_id: params[:other_user_id], action: 1)
    # #@outfits.map{|o| o.comments.new}
    # else
    #   @outfits = Outfit.where(user_id: current_user.id, action: 1)
    # end
    @outfits = Outfit.where(user_id: current_user.id)
  end

  def add_comment
    @outfit = Outfit.find(params[:id])
    comment = @outfit.comments.new
    comment.comment = params[:comment][:comment]
    comment.user_id = current_user.id
    comment.save
    redirect_to :back
  end

  def delete_comment
    @outfit = Outfit.find(params[:id])
    @comment = @outfit.comments.where(id: params[:comment_id]).first
    @comment.destroy
    redirect_to :back
  end

  def pending
    @outfits = Outfit.where(user_id: current_user.id, action: 0)
    puts "outfits #{@outfits.inspect}"
  end

  def status
    @outfit = Outfit.find(params[:id])
    @outfit.update(action: Outfit.actions[params[:status]])

    redirect_to outfits_path
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.name = params[:name]
    @outfit.save
    redirect_to outfit_path(@outfit), notice: 'Outfit name updated successfully.'
  end

  private

  def outfits_params
    params.require(:outfit).permit(:garment_id, :shoe_id, :accessory_id, comment: [])
  end
end
