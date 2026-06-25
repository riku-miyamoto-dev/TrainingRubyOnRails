class Admin::DepartmentsController < Admin::ApplicationController
  def index
    @department = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
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
end
