class UsersController < ApplicationController
  
  def index
    @users = User.order(:name).page(params[:page]).per(params[:per_page])
    if params[:search].present?  
      if @users.present?
        if params[:search][:query_name].present?
          @users = @users.where("name LIKE ?",
          User.sanitize_sql_like(params[:search][:query_name]) + "%")
        end
        if params[:search][:query_prefecture].present?
          @users = @users.where(prefecture: params[:search][:query_prefecture])
        end
      end
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def image
    @user = User.find(params[:id])
    send_data @user.image, type: @user.image_extension, disposition: "inline" 
  end
end
