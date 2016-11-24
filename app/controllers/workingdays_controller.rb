require 'query_report/helper'  # need to require the helper
class WorkingdaysController < ApplicationController
  before_action :set_workingday, only: [:show, :edit, :update, :destroy]
  include QueryReport::Helper  # need to include it
  def index
    @workingdays = Workingday.group(:year)
    session[:active_tab] ="payroll"
    session[:active_tab1] ="salaryprocess"
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
      if current_user.role.name == 'Company'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
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
      if current_user.role.name == 'Company'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: current_user.employee_id)
      end
    end
  end

  def workingday_xls
    @year = params[:year]
    @month = params[:month]
    @workingday = Workingday.where(year: params[:year],month_name: params[:month])
    if current_user.class == Group
      @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
    else
      if current_user.role.name == 'Company'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: current_user.employee_id)
      end
    end
    respond_to do |format|
      format.xls {render template: 'workingdays/workingday.xls.erb'}
    end
  end

  def workingday_pdf
    @year = params[:year]
    @month = params[:month]
    @workingday = Workingday.where(year: params[:year],month_name: params[:month])
    if current_user.class == Group
      @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
    else
      if current_user.role.name == 'Company'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month])
      elsif current_user.role.name == 'CompanyLocation'
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @workingdays = Workingday.where(year: params[:year], month_name: params[:month], employee_id: current_user.employee_id)
      end
    end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'workingday',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'workingdays/workingday.pdf.erb',
                  # show_as_html: params[:debug].present?,
                  :page_height      => 1000,
                  :dpi              => '300',
                  :margin           => {:top    => 10, # default 10 (mm)
                                :bottom => 10,
                                :left   => 20,
                                :right  => 20},
                  :show_as_html => params[:debug].present?
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
    # byebug
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

   def is_confirm_workingday

    # @employee = Employee.find(params[:id])
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
 
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workingday
    @workingday = Workingday.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workingday_params
    params.require(:workingday).permit(:employee_id, :month_name, :year, :day_in_month, :present_day, :total_leave, :holiday_in_month, :week_off_day, :absent_day, :payable_day)
  end
end