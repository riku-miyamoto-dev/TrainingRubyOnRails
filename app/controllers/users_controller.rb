class UsersController < ApplicationController
  def index
    @users = User.all
    if params[:search][:query_name].present?
      @users = @users.where("name LIKE ?",
      User.sanitize_sql_like(params[:search][:query_name]) + "%")
    end

    if params[:search][:query_prefecture].present?
      @users = @users.where(prefecture: params[:search][:query_prefecture])
    end

    if params[:search][:sort_birthday].present? && params[:search][:sort_birthday] == "生年月日 昇順"
      @users = @users.order(birthday: :asc)
    elsif params[:search][:sort_birthday].present? && params[:search][:sort_birthday] == "生年月日 降順"
      @users = @users.order(birthday: :desc)
    end

    if (
      params[:search][:between_birthday_fast].present?
      && params[:search][:between_birthday_late].present?
      &&  params[:search][:between_birthday_fast] > params[:search][:between_birthday_late]
      )
      @users = @users.where(birthday: params[:search][:between_birthday_late]..params[:search][:between_birthday_fast])
    end
    @users = @users.order(:name).page(params[:page]).per(params[:per_page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  def image
    @user = User.find(params[:id])
    send_data @user.image, type: @user.image_extension, disposition: "inline" 
  end
end
