# require 'query_report/helper'  # need to require the helper
class EmployeeDailyActivitiesController < ApplicationController
  before_action :set_employee_daily_activity, only: [:show, :edit, :update, :destroy]
# include QueryReport::Helper

  # GET /employee_daily_activities
  # GET /employee_daily_activities.json
  def index
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: current_user.employee_id).order("day asc")
  end

  # GET /employee_daily_activities/1
  # GET /employee_daily_activities/1.json
  def show
  end

  # GET /employee_daily_activities/new
  def new
    @employee_daily_activity = EmployeeDailyActivity.new
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: current_user.employee_id).order("day asc")
    session[:active_tab] = "TimeManagement"
    session[:active_tab1] = "TimeSheet"
  end

  # GET /employee_daily_activities/1/edit
  def edit
  end

  # POST /employee_daily_activities
  # POST /employee_daily_activities.json
  def create
    @employee_daily_activity = EmployeeDailyActivity.new(employee_daily_activity_params)
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: current_user.employee_id).order("day asc")
    respond_to do |format|
      if @employee_daily_activity.save
        @employee_daily_activity = EmployeeDailyActivity.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Employee Activity Already Exist.'
        format.js { @flag = false }
      end
    end
  end
 

  # PATCH/PUT /employee_daily_activities/1
  # PATCH/PUT /employee_daily_activities/1.json
  
   def update
    @employee_daily_activity.update(employee_daily_activity_params)
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: current_user.employee_id).order("day asc")
    @employee_daily_activity = EmployeeDailyActivity.new
  end

  # DELETE /employee_daily_activities/1
  # DELETE /employee_daily_activities/1.json
  def destroy
    @employee_daily_activity.destroy
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: current_user.employee_id).order("day asc")
  end

  def employee_details
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(status: 'Active',Company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(status: 'Active',department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      elsif current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    else
      @employees = Employee.all
    end
    session[:active_tab] = "TimeManagement"
    session[:active_tab1] = "TimeSheet"
  end

  def daily_show_activity_list
    @employee = Employee.find(params[:emp_id])
    @employee_daily_activities = EmployeeDailyActivity.where(employee_id: @employee.id)
     session[:active_tab] = "selfservice"
     session[:active_tab1] = "daily_activity"
  end

  def activity_report
    reporter(EmployeeDailyActivity.all, template_class: PdfReportTemplate) do
    filter :start_date, type: :date
    filter :employee_name, type: :string
    column(:Employee_ID, sortable: true) { |employee_daily_activity| employee_daily_activity.employee.try(:manual_employee_code) }
    column(:Employee_Name, sortable: true) { |employee_daily_activity| full_name(employee_daily_activity.employee) }
    column(:Designation, sortable: true) { |employee_daily_activity| employee_daily_activity.employee.joining_detail.employee_designation.name }
    column(:Today_Activity, sortable: true)
    column(:Tommorow_Activity, sortable: true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_daily_activity
      @employee_daily_activity = EmployeeDailyActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_daily_activity_params
      params.require(:employee_daily_activity).permit(:employee_id, :project_master_id, :today_activity, :tomorrow_plan, :day)
    end
end
