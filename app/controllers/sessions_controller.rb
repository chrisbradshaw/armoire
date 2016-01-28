class SessionsController < ApplicationController

   def create
     user = User.find(params[:user][:id])
     session[:user_id] = user.id
     redirect_to user
   end
 
   def destroy
     session[:user_id] = nil
     redirect_to root_path
   end
 end
end
