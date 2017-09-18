class DepartmentTypesController < ApplicationController
  before_action :set_department_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @department_type = DepartmentType.new
    @department_types = DepartmentType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="CompanyType"
  end

  def edit
  end

  def create
    @department_type = DepartmentType.new(department_type_params)
    @department_types = DepartmentType.all
    respond_to do |format|
      if @department_type.save
        @department_type = DepartmentType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Department Type Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  def update
    @department_type.update(department_type_params)
    @department_types = DepartmentType.all
    @department_type = DepartmentType.new
  end

  def destroy
    @department_type.destroy
    @department_types = DepartmentType.all
  end
  
  private

  def set_department_type
    @department_type = DepartmentType.find(params[:id])
  end

  def department_type_params
    params.require(:department_type).permit(:is_confirm,:name,:code,:description)
  end
end
