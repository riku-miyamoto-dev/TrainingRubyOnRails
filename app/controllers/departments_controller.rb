class DepartmentsController < ApplicationController

  def index
    add_breadcrumb('部署一覧')
    @department = Department.all
  end

  def show
    @department = Department.find(params[:id])
    add_breadcrumb(@department.name)
  end
end
