require 'query_report/helper'  # need to require the helper
class WorkingdaysController < ApplicationController
  before_action :set_workingday, only: [:show, :edit, :update, :destroy]
  include QueryReport::Helper  # need to include it
  def index
    @workingdays = Workingday.group(:year)
   session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def show
  end

  def new
    @workingday = Workingday.new
  end

  def edit
  end

  def create
    @workingday = Workingday.new(workingday_params)
    respond_to do |format|
      if @workingday.save
        format.html { redirect_to @workingday, notice: 'Workingday was successfully created.' }
        format.json { render :show, status: :created, location: @workingday }
      else
        format.html { render :new }
        format.json { render json: @workingday.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @workingday.update(workingday_params)
        format.html { redirect_to @workingday, notice: 'Workingday was successfully updated.' }
        format.json { render :show, status: :ok, location: @workingday }
      else
        format.html { render :edit }
        format.json { render json: @workingday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workingday.destroy
    respond_to do |format|
      format.html { redirect_to workingdays_path, notice: 'Workingday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employees
    @workingday = Workingday.where(year: params[:year],month_name: params[:month])
    if current_user.class == Group
      @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
    else
      if current_user.role.name == 'GroupAdmin'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: current_user.employee_id)
      end
    end
  end

  def display_workingday
    @workingday = Workingday.where(year: params[:year],month_name: params[:month])
    if current_user.class == Group
      @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
    else
      if current_user.role.name == 'GroupAdmin'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: current_user.employee_id)
      end
    end

    respond_to do |f|
      f.js
      f.xls {render template: 'workingdays/workingday.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_datewise_employee',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'workingdays/workingday.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import_workingday
    @workingdays = Workingday.all
    respond_to do |format|
    format.html
    format.csv { send_data @workingdays.to_csv }
    format.xls
   end   
  end

  def import
    Workingday.import(params[:file])
    redirect_to import_workingday_workingdays_path, notice: "File imported."
  end

  def search_month_year
  end

  def search_month_year_xls
  end

  def generate_workingday
    @date, @is_stop = params[:date].to_date, params[:stop]
    @month, @year = @date.strftime("%B"), @date.strftime("%Y")
    @existing = Workingday.where(month_name: @month, year: @year).pluck(:employee_id)
    @all_employees = Employee.where(status: "Active").pluck(:id)  
    @employee_resignations = EmployeeResignation.stop_payment_request(@is_stop)
    @employees = @all_employees - (@existing + @employee_resignations)
    @workingdays = Workingday.collect_attendance(@date, @employees)
  end

  def generate_workingday_xls
    @date, @is_stop = params[:date].to_date, params[:stop]
    @month, @year = @date.strftime("%B"), @date.strftime("%Y")
    @existing = Workingday.where(month_name: @month, year: @year).pluck(:employee_id)
    @all_employees = Employee.where(status: "Active").pluck(:id)    
    @employee_resignations = EmployeeResignation.stop_payment_request(@is_stop)
    @employees = @all_employees - (@existing + @employee_resignations)
    @workingdays = Workingday.collect_attendance(@date, @employees)
  end

  def print_working_day
    @date = params[:date].to_date
    @employees = params[:ids]
    @workingdays = []
    @employees.each do |ee|
      workingday = Workingday.new
      e = Employee.find(ee)
      workingday.day_in_month = workingday.create_day_in_month(e,@date)
      #workingday.present_day = Attendance.where(attendance_date: @date.beginning_of_month..@date.end_of_month, employee_id: e.id).count
      workingday.total_leave = ParticularLeaveRecord.where(leave_date: @date.beginning_of_month..@date.end_of_month, employee_id: e.id).count
      workingday.holiday_in_month = Holiday.where(holiday_date: @date.beginning_of_month..@date.end_of_month).count
      workingday.week_off_day = WeekoffMaster.day(@date)
      workingday.absent_day = workingday.total_leave.to_f
      workingday.present_day = workingday.day_in_month.to_i - workingday.absent_day
      workingday.employee_id = e.id
      @workingdays << workingday
    end
  end

  def create_working_day
    @date = params[:date].to_date
    @employees = params[:ids]
    @workingdays = []
    @employees.each do |ee|
      workingday = Workingday.new
      e = Employee.find(ee)
      workingday.day_in_month = workingday.create_day_in_month(e,@date)
      #workingday.present_day = Attendance.where(attendance_date: @date.beginning_of_month..@date.end_of_month, employee_id: e.id).count
      workingday.total_leave = ParticularLeaveRecord.where(leave_date: @date.beginning_of_month..@date.end_of_month, employee_id: e.id).count
      workingday.holiday_in_month = Holiday.where(holiday_date: @date.beginning_of_month..@date.end_of_month).count
      workingday.week_off_day = WeekoffMaster.day(@date)
      workingday.absent_day = workingday.total_leave.to_f
      workingday.present_day = workingday.day_in_month.to_i - workingday.absent_day
      workingday.employee_id = e.id
      workingday.month_name = @date.strftime("%B")
      workingday.year = @date.strftime("%Y")
      workingday.save
    end
    flash[:notice] = 'Working Days Saved successfully'
    redirect_to search_month_year_workingdays_path
  end

 def workingdays_detail
    reporter(Workingday.filter_records(current_user), template_class: PdfReportTemplate) do
      
      filter :month_name, type: :string
      filter :year, type: :string
      column(:ID, sortable: true) { |workingday| workingday.employee.manual_employee_code }
      column(:Employee_name, sortable: true) { |workingday| full_name(workingday.employee) }
      column(:Month , sortable: true) { |workingday| workingday.month_name }
      column(:Year , sortable: true) { |workingday| workingday.year }
      column(:Day, sortable: true) { |workingday| workingday.day_in_month }
      column(:Present , sortable: true) { |workingday| workingday.present_day }
      column(:Holiday , sortable: true) { |workingday| workingday.holiday_in_month }
      column(:Week_off , sortable: true) { |workingday| workingday.week_off_day }
      column(:Absent , sortable: true) { |workingday| workingday.absent_day }
      column(:Pay_leave , sortable: true) { |workingday| workingday.pay_leave }
      column(:Nonpay_leave , sortable: true) { |workingday| workingday.nonpay_leave }
      column(:Payable , sortable: true) { |workingday| workingday.payable_day }

    end
    # session[:active_tab] = "leavemanagement"
    # session[:active_tab1] = "leavereport"
  end

  def workingdays_detail
    reporter(Workingday.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:ID, sortable: true) { |workingday| workingday.id }
      column(:EID, sortable: true) { |workingday| workingday.employee.manual_employee_code }
      column(:Employee_name, sortable: true) { |workingday| full_name(workingday.employee) }
      column(:Month , sortable: true) { |workingday| workingday.month_name }
      column(:Year , sortable: true) { |workingday| workingday.year }
      column(:Present , sortable: true) { |workingday| workingday.present_day }

      column(:Day, sortable: true) { |workingday| workingday.day_in_month }
      column(:Present , sortable: true) { |workingday| workingday.present_day }
      column(:Holiday , sortable: true) { |workingday| workingday.holiday_in_month }
      column(:Week_off , sortable: true) { |workingday| workingday.week_off_day }
      column(:Absent , sortable: true) { |workingday| workingday.absent_day }
      column(:Pay_leave , sortable: true) { |workingday| workingday.pay_leave }
      column(:Nonpay_leave , sortable: true) { |workingday| workingday.nonpay_leave }
      column(:Payable , sortable: true) { |workingday| workingday.payable_day }

      column(:cl_leave, sortable: true) { |workingday| workingday.cl_leave }
      column(:el_leave , sortable: true) { |workingday| workingday.el_leave }
      column(:esic_leave , sortable: true) { |workingday| workingday.esic_leave }
      column(:coff_leave , sortable: true) { |workingday| workingday.coff_leave }
      column(:advance_leave , sortable: true) { |workingday| workingday.advance_leave }
     

    end
    # session[:active_tab] = "leavemanagement"
    # session[:active_tab1] = "leavereport"
  end

   def is_confirm_workingday
     @workingday_ids = params[:workingday_ids]
    if @workingday_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to workingdays_path
      # redirect_to show_employee_salary_template_employee_salary_templates_path(id: @employee.id)
    else
      @workingday_ids.each do |did|
      @workingday = Workingday.find(did)
      @workingday.update(is_confirm: true) 
      # InterviewScheduleMailer.sample_email_to_interviewer(@interview_schedule).deliver_now
      flash[:notice] = "Confirmed Successfully" 
      end 
      redirect_to workingdays_path
    # redirect_to show_employee_salary_template_employee_salary_templates_path(id: @employee.id)
    end
  end
  
  def revert_workingday
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def show_employee
    @month = params[:month]
    @year = params[:year]
    if current_user.class == Group
      @workingday = Salaryslip.where(month: @month,year: @year).pluck(:workingday_id)
      @workingdays = Workingday.where(month_name: @month, year: @year.to_s)
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @workingday = Salaryslip.where(month: @month,year: @year).pluck(:workingday_id)
        @workingdays = Workingday.where(month_name: @month, year: @year.to_s).where.not(id: @workingday)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @workingday = Salaryslip.where(month: @month,year: @year,employee_id: @employee).pluck(:workingday_id)
        @workingdays = Workingday.where(month_name: @month, year: @year.to_s).where.not(id: @workingday)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingday = Salaryslip.where(month: @month,year: @year,employee_id: @employees).pluck(:workingday_id)
        @workingdays = Workingday.where(month_name: @month,year: @year.to_s).where.not(id: @workingday)

        # @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        # @workingdays = Workingday.where(month_name: @month, year: @year.to_s, employee_id: @employees)
      end  
    end    
  end

  def revert_all_workingday
    @month = params[:month]
    @year = params[:year]
    date = Date.new(@year.to_i,Workingday.months[@month])
    @workingday_ids = params[:workingday_ids]
    if @workingday_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to revert_workingday_workingdays_path
    else
      @workingday_ids.each do |wid|
        @workingday = Workingday.find(wid)
        @workingdays = Workingday.where(employee_id: @workingday.employee_id, month_name: date.strftime("%B"), year: date.strftime("%Y"))
        @workingdays.destroy_all

        EmployeeAttendance.where("strftime('%m/%Y', day) = ? AND employee_id = ? ", date.strftime('%m/%Y'),@workingday.employee_id).update_all(is_confirm: false)
        EmployeeWeekOff.where("strftime('%m/%Y', date) = ? AND employee_id = ? ", date.strftime('%m/%Y'),@workingday.employee_id).update_all(is_confirm: false)
        
      end
      flash[:notice] = "Revert successfully"
      redirect_to revert_workingday_workingdays_path
    end
  end

  def search_by_month_year
  end

  def month_year_wise_record
    month1 = params[:salary][:month1]
    year1 = params[:salary][:year1]
    month2 = params[:salary][:month2]
    year2 = params[:salary][:year2]
    @date1 = Date.new(year1.to_i, Workingday.months[month1])
    @date2 = Date.new(year2.to_i, Workingday.months[month2])

    @d1 = @date1.strftime('%B/%Y')
    @d2 = @date2.strftime('%B/%Y')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workingday
    @workingday = Workingday.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workingday_params
    params.require(:workingday).permit(:gatepass,:employee_id, :month_name, :year, :day_in_month, :present_day, :total_leave, :holiday_in_month, :week_off_day, :absent_day, :payable_day)
  end
end