require 'query_report/helper'  # need to require the helper
class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  include QueryReport::Helper  # need to include it


  def new
    @department = Department.new
    if current_user.class == Group
      @departments = Department.all
    else
      if current_user.role.name == 'GroupAdmin'
        @departments = Department.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:department_id)
        @departments = Department.where(id: @employees)
      elsif current_user.role.name == 'Branch'
        @departments = Department.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @departments = Department.where(id: current_user.department_id)
      end
    end
    session[:active_tab] = "company"
  end

  def edit
    @departments = Department.all
  end

  def create
    @department = Department.new(department_params)
    @department.save
    @departments = Department.all
    @department = Department.new
  end

  def update
    @department.update(department_params)
    @departments = Department.all
    @department = Department.new
  end

  def destroy
    @department.destroy
    @departments = Department.all
  end

  def department_list_xls
    reporter(Department.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:Department_ID, sortable: true) { |department| department.id }
      column(:Location_ID, sortable: true) { |department| department.company_location_id }
      column(:Department_Name, sortable: true) { |department| department.name }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def department_params
    params.require(:department).permit(:manual_department_code, :company_location_id, :name, :department_type_id, :contact_no, :description)
  end
end
