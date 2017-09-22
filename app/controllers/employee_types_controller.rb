class EmployeeTypesController < ApplicationController
  before_action :set_employee_type, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @employee_type = EmployeeType.new
    @employee_types = EmployeeType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /employee_types/1/edit
  def edit
  end

  def create
    @employee_type = EmployeeType.new(employee_type_params)
    @employee_types = EmployeeType.all
    respond_to do |format|
      if @employee_type.save
        @employee_type = EmployeeType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Employee Type Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  def update
    @employee_type.update(employee_type_params)
    @employee_types = EmployeeType.all
    @employee_type = EmployeeType.new
  end

  def destroy
    @employee_type.destroy
    @employee_types = EmployeeType.all
  end

   def employee_type_master
     @employee_types = EmployeeType.all
     respond_to do |f|
      f.js
      f.xls {render template: 'employee_types/employee_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' employee_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_types/employee_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_type
    @employee_type = EmployeeType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_type_params
    params.require(:employee_type).permit(:is_confirm,:name ,:code,:description)
  end
end
