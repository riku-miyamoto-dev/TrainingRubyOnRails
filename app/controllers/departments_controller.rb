class DepartmentsController < ApplicationController
  before_action :add_index_breadcrumb, only: %i[show]

  def index
    add_breadcrumb('部署一覧')
    @department = Department.all
  end

  def show
    @department = Department.find(params[:id])
    add_breadcrumb(@department.name)
  end

  private
  def add_index_breadcrumb
    add_breadcrumb('部署一覧', departments_url)
  end
end
