require 'query_report/helper'  # need to require the helper
class EmployeeDesignationsController < ApplicationController
  before_action :set_employee_designation, only: [:show, :edit, :update, :destroy]
  include QueryReport::Helper  # need to include it
  def new
    @employee_designation = EmployeeDesignation.new
    @employee_designations = EmployeeDesignation.all
    session[:active_tab] ="master"
    session[:active_tab1] ="employeeprofilesetup"
  end

  # GET /employee_designations/1/edit
  def edit
  end

  # POST /employee_designations
  # POST /employee_designations.json
  def create
    @employee_designation = EmployeeDesignation.new(employee_designation_params)
    @employee_designations = EmployeeDesignation.all
    respond_to do |format|
      if @employee_designation.save
        @employee_designation = EmployeeDesignation.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Employee Designation Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /employee_designations/1
  # PATCH/PUT /employee_designations/1.json
  def update
    @employee_designation.update(employee_designation_params)
    @employee_designations = EmployeeDesignation.all
    @employee_designation = EmployeeDesignation.new
  end

  # DELETE /employee_designations/1
  # DELETE /employee_designations/1.json
  def destroy
    @employee_designation.destroy
    @employee_designations = EmployeeDesignation.all
  end

  def is_confirm
    @employee_designation = EmployeeDesignation.find(params[:employee_designation])
    EmployeeDesignation.find(@employee_designation.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_employee_designation_path
  end

  def employee_designation_list
    reporter(EmployeeDesignation.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:ID, sortable: true) { |employee_designation| employee_designation.try(:id) }
      column(:Name, sortable: true) { |employee_designation| employee_designation.name }
    end
   
  end

  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_designation
    @employee_designation = EmployeeDesignation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_designation_params
    params.require(:employee_designation).permit(:is_confirm,:name,:description)
  end
end
