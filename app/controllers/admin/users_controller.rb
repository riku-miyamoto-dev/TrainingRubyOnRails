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
    image_file = user_params[:user_img]
    
    if not image_file.blank?
      @user.user_img = image_file.read
      @user.user_img_extension = image_file.content_type  
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
    image_record = user_params
    
    if params[:user][:user_img].present?
      update_img = params[:user][:user_img]

      image_record[:user_img] = update_img.read
      image_record[:user_img_extension] = update_img.content_type 
    end
    
    if @user.update(image_record)
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
        :user_img,
        :user_img_extension,
        skill_ids:[],
      ])
    end
end
