class AccessoriesController < ApplicationController

 before_action :set_post, only: [:show, :edit, :update, :destroy]

   # GET /posts
   # GET /posts.json
   def index
     @accessory = Accessories.all
   end

   # GET /posts/1
   # GET /posts/1.json
   def show
   end

   # GET /posts/new
   def new
     @accessory = Accessory.new
   end

   # GET /posts/1/edit
   def edit
   end

   # POST /posts
   # POST /posts.json
   def create
     @accessory = Accessory.new(accessory_params)
       if @accessory.save
         flash[:success] = "Your accessory has been placed in the Armoire!"
         redirect_to @accessory
       else
         render 'new'
       end
   end


     # respond_to do |format|
     #   if @accessory.save
     #     format.html { redirect_to @accessory, notice: 'Accessory was successfully created.' }
     #     format.json { render action: 'show', status: :created, location: @accessory }
     #   else
     #     format.html { render action: 'new' }
     #     format.json { render json: @accessory.errors, status: :unprocessable_entity }
     #   end
     # end
   end

   # PATCH/PUT /posts/1
   # PATCH/PUT /posts/1.json
   def update
     if @accessory.update(accessory_params)
       flash[:success] = "Your shoe has been updated!"
     else
       render 'new'
     end
   end
     # respond_to do |format|
     #   if @accessory.update(post_params)
     #     format.html { redirect_to @accessory, notice: 'Post was successfully updated.' }
     #     format.json { head :no_content }
     #   else
     #     format.html { render action: 'edit' }
     #     format.json { render json: @accessory.errors, status: :unprocessable_entity }
     #   end
     # end
   end

   # DELETE /posts/1
   # DELETE /posts/1.json
   def destroy
     @accessory.destroy
     respond_to do |format|
       format.html { redirect_to accessory_url }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_accessory
       @accessory = Accessory.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def accessory_params
       params.require(:accessory).permit(:name, :element, :style, :color, :occasion, :season, :clean, :last_worn)
     end
end