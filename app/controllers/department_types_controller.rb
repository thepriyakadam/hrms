class DepartmentTypesController < ApplicationController
  before_action :set_department_type, only: [:show, :edit, :update, :destroy]
  ##load_and_authorize_resource

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

    def department_type_master
    @department_types = DepartmentType.all
     respond_to do |f|
      f.js
      f.xls {render template: 'department_types/department_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'department_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'department_types/department_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_department_types_path
      else
     DepartmentType.import(params[:file])
     redirect_to new_department_type_path, notice: "File imported."
     end
  end
  
  private

  def set_department_type
    @department_type = DepartmentType.find(params[:id])
  end

  def department_type_params
    params.require(:department_type).permit(:is_confirm,:name,:code,:description)
  end
end
