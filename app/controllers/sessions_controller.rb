class SessionsController < ApplicationController

  def new
  end
  def create
    user = User.find_by(email:params[:email])
    if user.present?
      session[:id] = user.id
    end
    redirect_to admin_users_path
  end

  def destroy
    session.delete :id
    redirect_to users_path
  end
end
  
