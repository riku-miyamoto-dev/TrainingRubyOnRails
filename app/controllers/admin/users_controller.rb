class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:image].present?
      @user.image = params[:user][:image].read
    end

    if params[:user][:image].present?
      @user.image_extension = params[:user][:image].content_type 
    end

    if @user.save
      redirect_to [:admin, @user]
    else
      render :new, 
      status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    
    if params[:user][:image].present?
      @user.image = params[:user][:image].read
    end

    if params[:user][:image].present?
      @user.image_extension = params[:user][:image].content_type 
    end
    
    if @user.save
      redirect_to [:admin, @user]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  
  def show_image
    @user = User.find(params[:id])
    send_data @user.image, type: @user.image_extension, disposition: :inline 
  end

  private
    def user_params
      params.expect(user: [
        :name,
        :furigana, 
        :gender, 
        :tel, 
        :phone, 
        :email, 
        :post_number, 
        :prefecture, 
        :city, 
        :town, 
        :street_address, 
        :building, 
        :birthday,
        :department_id, 
        :user_skill_id, 
        skill_ids:[]
      ])
    end
end
