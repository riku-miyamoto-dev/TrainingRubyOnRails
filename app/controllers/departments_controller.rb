class departmentsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_user

  def create
    @user.departments.where(department_params).first_or_create
    redirect_to @user, notice: "You are now subscribed."
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def department_params
      params.expect(department: [ :email ])
    end
end