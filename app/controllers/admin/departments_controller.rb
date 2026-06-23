class Admin::DepartmentsController < Admin::ApplicationController
  before_action :add_users_index_breadcrumb
  before_action :add_index_breadcrumb, only: %i[show new edit]
  def index
    @department = Department.all
    add_breadcrumb('部署一覧')
  end

  def show
    @department = Department.find(params[:id])
    add_breadcrumb(@department.name)
  end

  def new
    @department = Department.new
    add_breadcrumb('部署作成')
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to [:admin, @department]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @department = Department.find(params[:id])
    add_breadcrumb(@department.name, admin_department_path(@department))
    add_breadcrumb('部署編集')
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to [:admin, @department]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @department = Department.find(params[:id])
    if @department.destroy
      redirect_to admin_departments_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  
  private
  def department_params
    params.expect(department: [ 
      :name 
    ])
  end
  def add_index_breadcrumb
    add_breadcrumb('部署一覧', admin_departments_path)
  end
  def add_users_index_breadcrumb
    add_breadcrumb('ユーザー管理', admin_users_path)
  end
end
