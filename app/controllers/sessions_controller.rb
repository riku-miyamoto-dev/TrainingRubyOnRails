class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email:params[:email])
    cookies[:id] = @user.id
    redirect_to users_path
  end

  def destroy
    cookies.delete :id
    redirect_to users_path
  end
end
  
