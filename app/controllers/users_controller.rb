class UsersController < ApplicationController
  
  def index
    @users = User.all.page(params[:page]).per(100)
  end

  def show
    @user = User.find(params[:id])
  end
  def image
    @user = User.find(params[:id])
    send_data @user.image, type: @user.image_extension, disposition: "inline" 
  end
end
