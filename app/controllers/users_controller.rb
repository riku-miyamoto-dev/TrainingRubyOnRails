class UsersController < ApplicationController
  def index
    @users = User.all
    if params[:name].present?
      @users = @users.where("name LIKE ?",
      User.sanitize_sql_like(params[:name]) + "%")
    end

    if params[:prefecture].present?
      @users = @users.where(prefecture: params[:prefecture])
    end

    if params[:sort].present? && params[:sort] == "生年月日 昇順"
      @users = @users.order(birthday: :asc)
    elsif params[:sort].present? && params[:sort] == "生年月日 降順"
      @users = @users.order(birthday: :desc)
    elsif params[:sort].present? && params[:sort] == "id 昇順"
      @users = @users.id_sort_ascending_order
    elsif params[:sort].present? && params[:sort] == "id 降順"
      @users = @users.id_sort_descending_order
    end

    if (
      params[:between_birthday_fast].present?
      && params[:between_birthday_late].present?
      &&  params[:between_birthday_fast] > params[:between_birthday_late]
    )
      @users = @users.where(birthday: params[:between_birthday_late]..params[:between_birthday_fast])
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
