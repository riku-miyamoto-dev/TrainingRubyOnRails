class DepartmentsController < ApplicationController
  def index
    @department = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end
end
