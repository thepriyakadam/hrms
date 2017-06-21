require 'query_report/helper'  # need to require the helper
class EmployeeAttendancesController < ApplicationController
  before_action :set_employee_attendance, only: [:show, :edit, :update, :destroy]
  before_action :check_params, only: [:create_attendance]
  include QueryReport::Helper  # need to include it

  # GET /employee_attendances
  # GET /employee_attendances.json
  def index
    @employee_attendances = EmployeeAttendance.group("strftime('%Y',day)")
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"

  end

  # GET /employee_attendances/1
  # GET /employee_attendances/1.json
  def show
  end

  # GET /employee_attendances/new
  def new
    @employee_attendance = EmployeeAttendance.new
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end
 

  # GET /employee_attendances/1/edit
  def edit
  end

  # POST /employee_attendances
  # POST /employee_attendances.json
  def create
    @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
    respond_to do |format|
      if @employee_attendance.save
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully created.' }
        format.json { render :show, status: :created, location: @employee_attendance }
      else
        format.html { render :new }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_attendances/1
  # PATCH/PUT /employee_attendances/1.json
  def update
    respond_to do |format|
      if @employee_attendance.update(employee_attendance_params)
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_attendance }
      else
        format.html { render :edit }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_attendances/1
  # DELETE /employee_attendances/1.json
  def destroy
    @employee_attendance.destroy
    respond_to do |format|
      format.html { redirect_to employee_attendances_url, notice: 'Employee attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def department_wise_employee_list
    @costcenter, @date = params[:salary][:name], params[:salary][:day].to_date
      if current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",id: joining_detail).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif current_user.role.name == 'Admin'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",company_id: current_user.company_location.company_id,id: joining_detail).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif current_user.role.name == 'Branch'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",company_location_id: current_user.company_location_id,id: joining_detail).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif current_user.role.name == 'Employee'
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
          @employees = Employee.where(status: "Active",id: current_user.employee_id,id: joining_detail).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        elsif
          joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
        @employees = Employee.where(status: "Active",id: joining_detail).filter_by_date_and_costcenter(@date, @costcenter, current_user)
        #@employees = Employee.filter_by_date_costcenter_and_department(@date, @costcenter, @department, current_user)
        end
      @emp_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? AND present = ?", @date.strftime('%m/%Y'), "W")
        @emp_attendances.each do |e|
          date = e.day.to_datetime
          yd = (date-1).strftime('%Y-%m-%d')
          tmr = (date+1).strftime('%Y-%m-%d')
          yd_emp = EmployeeAttendance.where(day: yd,employee_id:e.employee_id).take
          tmr_emp = EmployeeAttendance.where(day: tmr,employee_id:e.employee_id).take
          if yd_emp.try(:present) == "A" && tmr_emp.try(:present) == "A"
            EmployeeAttendance.find_by(id: e.id).update(present: "A")
          else
          end
        end
      @employee_attendance = EmployeeAttendance.new
    end  
  end
    
  def create_employee_attendance
    @employee_ids = params[:employee_ids]
    day = params[:employee_attendances][:day]
    present = params[:employee_attendances][:present]
    #department = params[:employee_attendances][:department_id]
    @employee = Employee.where(id: @employee_ids)
    
    if @employee_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
    else
      @employee_ids.each do |eid|
        @emp = Employee.find_by_id(eid)

      EmployeeAttendance.create(employee_id: eid,day: day,present: present,department_id: @emp.department_id, is_confirm: false)  
      #Holiday.where(holiday_date: day).update_all(is_taken: true)
      flash[:notice] = "Created successfully"
      end
    end
    redirect_to new_employee_attendance_path
  end

  def loginwise_attendance_form
    session[:active_tab] ="EmployeeSelfService"
  end

  def attendance
    @year = params[:year]
    @month = params[:month]
    @department = params[:department_id]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def revert_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def show_employee
    @costcenter_id =params[:salary][:costcenter_id]
    @employees = Employee.where(status: 'Active').pluck(:id)
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id,employee_id: @employees).pluck(:employee_id)
    #@department_id = params[:salary][:department_id]
    @day = params[:salary][:day]
    @present = params[:salary][:present]
    @employee_attendances = EmployeeAttendance.where(present: @present ,employee_id: @costcenter).where(day: @day.to_date,is_confirm: false).group(:employee_id)
    @employee_attendance_id = EmployeeAttendance.where(present: @present ,employee_id: @costcenter).where(day: @day.to_date,is_confirm: false).group(:employee_id).take
  end

  def destroy_employee_attendance
    @costcenter_id =params[:costcenter_id]
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id).pluck(:employee_id)
    @day = params[:day]
    @present = params[:present]
    @employee_attendance_ids = params[:employee_attendance_ids]
    if @employee_attendance_ids.nil?
      flash[:alert] = "Please Select Employees"
      redirect_to revert_attendance_employee_attendances_path
    else
      @employee_attendance_ids.each do |eid|
        @employee_attendance = EmployeeAttendance.find(eid)
        EmployeeAttendance.where(id: eid).destroy_all
      end
      flash[:notice] = "Revert successfully"
      redirect_to revert_attendance_employee_attendances_path
    end
  end

  def department_wise_emp
    @year = params[:year]
    @month = params[:month]
    @department = params[:salary][:department_id]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? AND department_id = ?", @date.strftime('%m/%Y'),@department).group(:employee_id)
  end

  def monthly_attendance
    @year, @month = params[:year], params[:month]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def display_attendance_1
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    status = params[:employee_attendance][:status]
    # @employee_attendances = EmployeeAttendance.where(day: @month)
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @start_date = @date
    @end_date = @date.end_of_month
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if status == 'Active'
          @emp = Employee.where(status: 'Active').pluck(:id)
        elsif status == 'Inactive'
          @emp = Employee.where(status: 'Inactive').pluck(:id)
        else
          @emp = Employee.all.pluck(:id)
        end
         @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      elsif current_user.role.name == 'Admin'
        if status == 'Active'
          @emp = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
        elsif status == 'Inactive'
          @emp = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
        else
          @emp = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        end
        @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)   
      elsif current_user.role.name == 'Branch'
        if status == 'Active'
          @emp = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
        elsif status == 'Inactive'
          @emp = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
        else
          @emp = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        end
        @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @emp).group(:employee_id)
      end
    end
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def emp_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def display_attendance_2
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]
    status = params[:employee][:status]
    @from_date = @from.to_date
    @to_date = @to.to_date
    #@date = Date.new(@year.to_i, Workingday.months[@month])
    #@day = @date.end_of_month.day
    #@start_date = @date
    #@end_date = @date.end_of_month

    if current_user.class == Group
      if company == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active').pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive').pluck(:id)
        else
          @employees = Employee.all.pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
      elsif location == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
      elsif department == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
        else
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
      else
        if status == 'Active'
           @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        else
           @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active').pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive').pluck(:id)
          else
            @employees = Employee.all.pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        else
          if status == 'Active'
           @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
           @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        end
        elsif current_user.role.name == 'Admin'
         if company == ""
          if status == 'Active' 
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
          elsif status == 'Inactive' 
            @employees = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
          else
            @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif location == ""
          if status == 'Active' 
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive' 
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif department == ""
          if status == 'Active' 
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive' 
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        else
          if status == 'Active' 
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive' 
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        end
        elsif current_user.role.name == 'Branch'
          if company == "" || location == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
            else
              @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
         elsif department == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
            else
              @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          else 
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        end
        elsif current_user.role.name == 'HOD'
          if company == "" || location == "" || department == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',department_id: current_user.department_id).pluck(:id)
            else
              @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        else 
           if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        end
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_attendances/employee_attendance_1.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_attendances/employee_slip_pdf.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end
  
  def datewise_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def show_datewise_attendance
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]
    from = @from.to_date
    to = @to.to_date
    payroll_period = PayrollPeriod.where(status: true).take

    if from == payroll_period.from.to_date && to == payroll_period.to.to_date
      if current_user.class == Group
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active').pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive').pluck(:id)
          else
            @employees = Employee.all.pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        else
          if status == 'Active'
             @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
             @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
        end
      elsif current_user.class == Member
        if current_user.role.name == 'GroupAdmin'
          if company == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active').pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive').pluck(:id)
            else
              @employees = Employee.all.pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          elsif location == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          elsif department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
            else
              @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          else
            if status == 'Active'
             @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
             @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          end
          elsif current_user.role.name == 'Admin'
           if company == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
            else
              @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          elsif location == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          elsif department == ""
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
            else
              @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          else
            if status == 'Active' 
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive' 
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          end
          elsif current_user.role.name == 'Branch'
            if company == "" || location == ""
              if status == 'Active' 
                @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
              elsif status == 'Inactive' 
                @employees = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
              else
                @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
              end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
           elsif department == ""
              if status == 'Active' 
                @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
              elsif status == 'Inactive' 
                @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
              else
                @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
              end
              @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
            else 
              if status == 'Active' 
                @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              elsif status == 'Inactive' 
                @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              else
                @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          end
          elsif current_user.role.name == 'HOD'
            if company == "" || location == "" || department == ""
              if status == 'Active' 
                @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
              elsif status == 'Inactive' 
                @employees = Employee.where(status: 'Inactive',department_id: current_user.department_id).pluck(:id)
              else
                @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
              end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          else 
             if status == 'Active' 
                @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              elsif status == 'Inactive' 
                @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              else
                @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
              end
            @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees).group(:employee_id)
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      end
    else
      flash[:alert] = "Please select correct date (i.e. 26 to 25)"
      redirect_to datewise_attendance_employee_attendances_path
    end
  end

  def create_attendance_datewise
    @employees, @attendances, work_data_structure = params[:employees], params[:attendances], []
    @from = params[:from]
    @to = params[:to]
    params.permit!
    @employees.each { |e| work_data_structure << params[e] }
    Workingday.create(work_data_structure)

    @employees.try(:each) do |x|
      EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: x).update_all(is_confirm: true)
      EmployeeWeekOff.where(date: @from.to_date..@to.to_date,employee_id: x).update_all(is_confirm: true)
      d=Workingday.where(employee_id: x)
      d.each do |f|
        f.update(calculated_payable_days: f.payable_day)
      end
    end
    flash[:notice] = "Workingday successfully saved."
    redirect_to datewise_attendance_employee_attendances_path
  end

  def create_attendance
      @employees, @attendances, work_data_structure = params[:employees], params[:attendances], []
      
      @month = params[:month]
      @year = params[:year]
      @date = Date.new(@year.to_i, Workingday.months[@month])
      
      params.permit!
      @employees.each { |e| work_data_structure << params[e] }
      a = Workingday.create(work_data_structure)      
      # @employees.try(:each) do |x| 
      #   EmployeeAttendance.where("employee_id = ? AND strftime('%m/%Y', day) = ?",x,@date.strftime('%m/%Y')).update_all(is_confirm: true)
      # end
      @emp1 = params[:employees]
      b=a.last
      @payroll_overtime_masters = PayrollOvertimeMaster.where(is_active: true,is_payroll: true).take
      @emp1.try(:each) do |x| 
          emp_attend=EmployeeAttendance.where(employee_id: x,month_name: b.month_name)
          
          EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? AND employee_id = ?", @date.strftime('%m/%Y'),x).update_all(is_confirm: true)
          EmployeeWeekOff.where("DATE_FORMAT(date,'%m/%Y') = ? AND employee_id = ?", @date.strftime('%m/%Y'),x).update_all(is_confirm: true)
        
          d=Workingday.where(employee_id: x)
          d.each do |f|
            f.update(calculated_payable_days: f.payable_day)
          end

          ot_hours=emp_attend.sum(:overtime_hrs).to_f
          diff_hours=emp_attend.sum(:difference_hrs).to_f
          calculated_diff=ot_hours-diff_hours
          # Workingday.where(employee_id: x).update_all(ot_days: calculated_diff.to_f / @payroll_overtime_masters.company_hrs.to_f)
          # byebug
          joining_detail = JoiningDetail.where(employee_id: x).take
        if try(:joining_detail).try(:ot_option) == true
          Workingday.where(employee_id: x).update_all(ot_hours: calculated_diff.to_f.round(2))
          # d=Workingday.where(employee_id: x)
          #   d.each do |f|
          #     f.update(calculated_payable_days: f.payable_day)
          #   end
      end#emp1 loop
          work=Workingday.where("ot_hours < ?", 0).pluck(:id)
          @workingdays = Workingday.where(id: work)
          @workingdays.each do |wor|
          
          emp_att=EmployeeAttendance.where(employee_id: wor.employee_id,month_name: wor.month_name)
          
          overtime_hours=emp_att.sum(:overtime_hrs).to_f
          difference_hours=emp_att.sum(:difference_hrs).to_f
          calculated_diff_hours=(overtime_hours-difference_hours)
          total_hrs =  wor.payable_day.to_f * @payroll_overtime_masters.company_hrs.to_f
          result = total_hrs - wor.ot_hours.abs.to_f
          final_payable_day = result / @payroll_overtime_masters.company_hrs.to_f
         
          Workingday.where(id: wor,employee_id: wor.employee_id).update_all(calculated_payable_days: final_payable_day.to_f,ot_hours: 0)
          # Workingday.update_all(is_confirm: true)
          end#workingdays loop
        end#joining_detail
      flash[:notice] = "Workingday successfully saved."
      redirect_to employee_attendances_path
  end

  def costcenter_wise_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def show_costcenter_wise_attendance
    @to, @from = params[:to], params[:from]
    @costcenter_id =params[:costcenter]
    @status =params[:status]
    @from_date = @from.to_date
    @to_date = @to.to_date
    
    if @status == 'Active'
      @employees = Employee.where(status: 'Active').pluck(:id)
    elsif @status == 'Inactive'
      @employees = Employee.where(status: 'Inactive').pluck(:id)
    else
      @employees = Employee.all.pluck(:id)
    end
    @costcenter = JoiningDetail.where(cost_center_id: @costcenter_id,employee_id: @employees).pluck(:employee_id)
  
    @employees = EmployeeAttendance.where(day: @from.to_date..@to.to_date,is_confirm: false,employee_id: @costcenter)
    
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_attendances/costcenter_wise_excel.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_attendances/costcenter_wise_pdf.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end 
  
  def revert_attendance_employeewise
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
  end

  def show_employee_list
    @employee_id = params[:salary][:employee_id]
    @month = params[:salary][:month]
    @year = params[:salary][:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @employee_attendance_id = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? and employee_id = ? and is_confirm = ?", @date.strftime('%m/%Y'),@employee_id,false).take
    @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ? and employee_id = ? and is_confirm = ?", @date.strftime('%m/%Y'),@employee_id,false)
  end

  def destroy_attendance_employeewise
    @employee_id = params[:employee_id]
    @month = params[:month]
    @year = params[:year]
    @employee_attendance_ids = params[:employee_attendance_ids]
      if @employee_attendance_ids.nil?
        flash[:alert] = "Please Select Employees"
        redirect_to revert_attendance_employeewise_employee_attendances_path
      else
        @employee_attendance_ids.each do |eid|
          @employee_attendance = EmployeeAttendance.find(eid)
          EmployeeAttendance.where(id: eid,employee_leav_request_id: nil,on_duty_request_id: nil).destroy_all
        end
        flash[:notice] = "Revert successfully"
        redirect_to revert_attendance_employeewise_employee_attendances_path
      end
  end

  def display_employee_attendance_list
    @employee_id = current_user.employee_id
    @month = params[:month].to_s
    @year = params[:year].to_s
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employee_id).group(:employee_id)
    # @employees = EmployeeAttendance.where("strftime('%m/%Y', day) = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
  end

  def employee_attendances_list
    @employees1 = EmployeeAttendance.where(employee_id: current_user.employee_id).take
    @month = @employees1.day.strftime("%B")
    @year = @employees1.day.strftime("%Y")
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: current_user.employee_id).group(:employee_id)
  end

  def attendance_report
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def confirm_attendance
    @month = params[:employee_attendance][:month]
    @year = params[:employee_attendance][:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end

  def create_attendance_1
    @employees, @attendances, work_data_structure, @date = params[:employees], params[:attendances], [], params[:date]
    params.permit!
    @employees.each { |e| work_data_structure << params[e] }
    #EmployeeAttendance.where(employee_id: @employees).where("strftime('%m/%Y', day) = ? and is_confirm = ?", @date.to_date.strftime('%m/%Y'),false).update_all(is_confirm: true)
    Workingday.create(work_data_structure)
    flash[:notice] = "Workingday successfully saved."
    redirect_to confirm_attendance_form_employee_attendances_path
  end

  def emp_attendance_1_list
    @month = params[:month]
    @year = params[:year]
    @date = Date.new(@year.to_i, Workingday.months[@month])
    @day = @date.end_of_month.day
    @employees = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).group(:employee_id)
  end
  
  def calculate_attendance
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def display_total
    @month = params[:employee][:month]
    @year = params[:employee][:year]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]
    status = params[:employee][:status]

    @date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      if company == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active').pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive').pluck(:id)
        else
          @employees = Employee.all.pluck(:id)
        end 
        @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif location == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
        end 
        @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      elsif department == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
        else
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
        end 
        @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      else
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        end 
        @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active').pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive').pluck(:id)
          else
            @employees = Employee.all.pluck(:id)
          end 
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end 
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end 
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        end
      elsif current_user.role.name == 'Admin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
          else
            @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
        end
        elsif current_user.role.name == 'Branch'
          if company == "" || location == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
            else
              @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
          elsif department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
            else
              @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
          else 
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
          end
        elsif current_user.role.name == 'HOD'
          if company == "" || location == "" || department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',department_id: current_user.department_id).pluck(:id)
            else
              @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
          else 
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where("DATE_FORMAT(day,'%m/%Y') = ?", @date.strftime('%m/%Y')).where(employee_id: @employees).group(:employee_id)
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      end

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_attendances/attendance_total.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_attendances/attendance_total_pdf.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def select_date_department_form
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def show_departmntwise_employee
    @start = params[:employee][:day]
    @end = params[:employee][:to_date]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]
    status = params[:employee][:status]
    if current_user.class == Group
      if company == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active').pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive').pluck(:id)
        else
          @employees = Employee.all.pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
      elsif location == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
      elsif department == ""
       if status == 'Active'
        @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
       elsif status == 'Inactive'
        @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
       else
        @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
       end
        @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
      else
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active').pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive').pluck(:id)
          else
            @employees = Employee.all.pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        end
      elsif current_user.role.name == 'Admin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
          else
            @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        end
        elsif current_user.role.name == 'Branch'
          if company == "" || location == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
            else
              @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
         elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
          else 
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        end
        elsif current_user.role.name == 'HOD'
          if company == "" || location == "" || department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',department_id: current_user.department_id).pluck(:id)
            else
              @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
            end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        else 
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(day: @start.to_date..@end.to_date,employee_id: @employees).take
        end
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    end 

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_attendances/print_department_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'employee_attendance',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_attendances/print_department_wise.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end


  # def date_wise_xls
  #   @date, @present = params[:date], params[:present]
  #   @employee_attendances = EmployeeAttendance.where(day: @date.to_date,present: @present)
  #   respond_to do |format|
  #     format.xls {render template: 'employee_attendances/print_date_wise.xls.erb'}
  #   end
  # end
  def select_from_and_to_date
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def show_from_and_to_date
    @start = params[:employee][:day]
    @end = params[:employee][:to_date]
    @present = params[:employee][:present]
    company = params[:employee][:company_id]
    location = params[:employee][:company_location_id]
    department = params[:employee][:department_id]
    status = params[:employee][:status]
    #@employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date)
    
    if current_user.class == Group
      if company == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active').pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive').pluck(:id)
        else
          @employees = Employee.all.pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
      elsif location == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
      elsif department == ""
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
        else
          @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
      else
        if status == 'Active'
          @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        elsif status == 'Inactive'
          @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        else
          @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
        end
        @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
        @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active').pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive').pluck(:id)
          else
            @employees = Employee.all.pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        end
        elsif current_user.role.name == 'Admin'
         if company == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: current_user.company_location.company_id).pluck(:id)
          else
            @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        elsif location == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        elsif department == ""
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
          else
            @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        else
          if status == 'Active'
            @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          elsif status == 'Inactive'
            @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          else
            @employees = Employee.where(company_id: company.to_i,company_location_id: @location.to_i,department_id: department.to_i).pluck(:id)
          end
          @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
          @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
        end
        elsif current_user.role.name == 'Branch'
          if company == "" || location == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: current_user.company_location_id).pluck(:id)
            else
              @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
            @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
          elsif department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_location_id: location.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_location_id: location.to_i).pluck(:id)
            else
              @employees = Employee.where(company_location_id: location.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
            @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
          else 
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
            @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
          end
        elsif current_user.role.name == 'HOD'
          if company == "" || location == "" || department == ""
            if status == 'Active'
              @employees = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',department_id: current_user.department_id).pluck(:id)
            else
              @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
            @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
          else 
            if status == 'Active'
              @employees = Employee.where(status: 'Active',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            elsif status == 'Inactive'
              @employees = Employee.where(status: 'Inactive',company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            else
              @employees = Employee.where(company_id: company.to_i,company_location_id: location.to_i,department_id: department.to_i).pluck(:id)
            end
            @employee_attendances = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees)
            @employee_attendance_id = EmployeeAttendance.where(present: @present,day: @start.to_date..@end.to_date ,employee_id: @employees).take
          end
        elsif current_user.role.name == 'Superviser'
        elsif current_user.role.name == 'Employee'
        end
      end 

      respond_to do |f|
        f.js
        f.xls {render template: 'employee_attendances/from_date_wise_xls.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'employee_attendance',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'employee_attendances/from_date_wise_pdf.pdf.erb',
          show_as_html: params[:debug].present?
        end
      end
  end

  def manager_attendance_form
    session[:active_tab] ="ManagerSelfService"
  end

  def display_attendance_for_manager
    @from = params[:from]
    @to = params[:to]
    from = @from.to_date
    to = @to.to_date

    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employee = Employee.where(status: 'Active').pluck(:id)
        @employees = EmployeeAttendance.where(day: from..to,employee_id: @employee)
      elsif current_user.role.name == 'Admin'
        @employee = Employee.where(status: 'Active',company_id: current_user.company_location.company_id).pluck(:id)
        @employees = EmployeeAttendance.where(day: from..to,employee_id: @employee)
      elsif current_user.role.name == 'Branch'
        @employee = Employee.where(status: 'Active',company_location_id: current_user.company_location_id).pluck(:id)
        @employees = EmployeeAttendance.where(day: from..to,employee_id: @employee)
      elsif current_user.role.name == 'HOD'
        @employee = Employee.where(status: 'Active',department_id: current_user.department_id).pluck(:id)
        @employees = EmployeeAttendance.where(day: from..to,employee_id: @employee)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
    else
      @employee = Employee.where(status: 'Active').pluck(:id)
      @employees = EmployeeAttendance.where(day: from..to,employee_id: @employee)
    end
  end

def upload_daily_attendance
  session[:active_tab] ="TimeManagement"
  session[:active_tab1] ="daily_attendance"
end

def upload
   file = params[:file]
  if file.nil?
    flash[:alert] = "Please Select File!"
    redirect_to upload_daily_attendance_employee_attendances_path
  else
    DailyAttendance.import(params[:file])
    redirect_to upload_daily_attendance_employee_attendances_path, notice: "File imported."
  end
  last_record = DailyAttendance.last
  @daily_attendances = DailyAttendance.where(date: last_record.date)

  @daily_attendances.each do |da|
    # @first_record = DailyAttendance.where(employee_id: da.employee_code).first
    # if @first_record.reader_name == "Main Door Out" ||  @first_record.reader_name == "Emergency Out" 
    #   previous_date = (@first_record.date-1).strftime('%Y-%m-%d')
    #   @emp_attendance = EmployeeAttendance.where(employee_id: da.employee_code,day: previous_date).take
    #   @emp_attendance.update_all(out_time: @first_record.time)
    # else
    # end
    first_in = DailyAttendance.where(employee_code: da.employee_code).where("reader_name = ? OR reader_name = ? ", 'Main Door IN','Emergency IN').first
    last_out = DailyAttendance.where(employee_code: da.employee_code).where("reader_name = ? OR reader_name = ? ", 'Main Door Out','Emergency Out').last
    first_in_time = first_in.try(:time)
    last_out_time = last_out.try(:time)
    

    employee = Employee.find_by_manual_employee_code(da.employee_code)
    if employee.nil?
    else
      if first_in_time == nil && last_out_time == nil
        EmployeeAttendance.create(day: last_record.date,in_time: first_in_time,out_time: last_out_time,employee_id: employee.id,comment: "In & Out Time Not Available")
      elsif first_in_time == nil
        EmployeeAttendance.create(day: last_record.date,in_time: first_in_time,out_time: last_out_time,employee_id: employee.id,comment: "In Time Not Available")
      elsif last_out_time == nil
        EmployeeAttendance.create(day: last_record.date,in_time: first_in_time,out_time: last_out_time,employee_id: employee.id,comment: "Out Time Not Available")
      else
        total_hrs = last_out_time.to_f - first_in_time.to_f
        working_hrs = total_hrs/3600
        EmployeeAttendance.create(day: last_record.date,in_time: first_in_time,out_time: last_out_time,employee_id: employee.id,working_hrs: working_hrs.round(2))
      end
    end#employee.nil?
  end#do

end

def select_date_and_employee
  session[:active_tab] ="TimeManagement"
  session[:active_tab1] ="Attendance"
end

def date_and_employeewise_attendance
  from = params[:employee][:from]
  to = params[:employee][:to]
  employee_id = params[:employee][:employee_id]
  @employee_attendances = EmployeeAttendance.where(employee_id: employee_id,day: from.to_date..to.to_date)
end

def daily_attendance_datewise
  session[:active_tab] ="TimeManagement"
  session[:active_tab1] ="daily_attendance"
end

def show_daily_attendance_datewise
  date = params[:employee][:date]
  @daily_attendances = DailyAttendance.where(date: date.to_date)
end

def datewise_daily_attendance
  session[:active_tab] ="TimeManagement"
  session[:active_tab1] ="Attendance"
end

def show_datewise_daily_attendance
  date = params[:employee][:date]
  @employee_attendances = EmployeeAttendance.where(day: date.to_date)
end

def modal_edit_daily_attendance 
  @employee_attendance = EmployeeAttendance.find(params[:format])
end

def update_daily_attendance
  @employee_attendance = EmployeeAttendance.find(params[:employee_attendance_id])
  in_time = params[:employee_attendance][:in_time]
  out_time = params[:employee_attendance][:out_time]
  present = params[:employee_attendance][:present]
  comment = params[:employee_attendance][:comment]

  @employee_attendance.update(in_time: in_time,out_time: out_time,present: present,comment: comment)
  flash[:notice] = "Updated Successfully!"
  redirect_to datewise_daily_attendance_employee_attendances_path
end

def import
  file = params[:file]
  if file.nil?
    flash[:alert] = "Please Select File!"
  redirect_to import_employee_attendance_employee_attendances_path
  else
  EmployeeAttendance.import(params[:file])
  redirect_to import_employee_attendance_employee_attendances_path, notice: "File imported."
  end
end

def import_employee_attendance
  @employee_attendances = EmployeeAttendance.all
  respond_to do |format|
    format.html
    # format.html { send_data @machine_attendances,
    # :type => 'text',
    # :disposition => "attachment; filename=your_file_name.txt" }
    format.csv { send_data @employee_attendances.to_csv }
    format.xls
  end
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Attendance"
end

  def import_employee_attendance_to_txt
    @employees = Employee.all
    respond_to do |format|
    format.html
    format.csv { send_data @employees.to_txt,filename: "employees-#{Date.today}.txt" }
      end
  end

  def self_service_datewise_attendance
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_id = params[:employee][:employee_id]
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee_id).order("day")
    
    respond_to do |format|
      format.js
      format.xls {render template: 'self_services/datewise_attendance_report_xls.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'self_service_datewise_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'self_services/datewise_attendance_report_pdf.pdf.erb',
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

  def manager_self_service_attendance
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    @employee = @employees + @employees_ind

    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee)

     respond_to do |format|
      format.js
      format.xls {render template: 'manager_self_services/datewise_attendance.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'manager_self_service_attendance',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'manager_self_services/datewise_attendance.pdf.erb',
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

  def datewise_report
    session[:active_tab] ="TimeManagement"
    session[:active_tab1] ="Report"
  end

  def show_datewise_report
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @company_id = params[:employee][:company_id]
    @location = params[:employee][:company_location_id]
    @department = params[:employee][:department_id]
    #@employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employee)
  
    if current_user.class == Group
      if @company_id == ""
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @employees = Employee.where(status: 'Active')
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
        @employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date,employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

      respond_to do |format|
      format.js
      format.xls {render template: 'employee_attendances/datewise_report.xls.erb'}
      format.html
      format.pdf do
        render pdf: 'show_datewise_report',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'employee_attendances/datewise_report.pdf.erb',
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

def search_by_date
  @employee_attendances = EmployeeAttendance.all
    reporter(@employee_attendances, template_class: PdfReportTemplate) do
      filter :day, type: :date
      # filter :current_status, type: :string
      #column(:Request_ID, sortable: true) { |employee_leav_request| employee_leav_request.id }
      column(:ID, sortable: true) { |employee_attendance| employee_attendance.employee.try(:manual_employee_code) }
      column(:MachineId, sortable: true) { |employee_attendance| employee_attendance.machine_attendance_id }
      column(:Employee_Name, sortable: true) { |employee_attendance| full_name(employee_attendance.employee) }
      column(:Day, sortable: true) { |employee_attendance| employee_attendance.day }
      column(:Month, sortable: true) { |employee_attendance| employee_attendance.month_name }
      column(:Company_In_Min_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:in_min_time) }
      column(:Company_In_Max_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:in_max_time) }
      column(:Company_In_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:in_time) }
      column(:Employee_In_Time, sortable: true) { |employee_attendance| employee_attendance.machine_attendance.try(:in) }
      column(:In_Time, sortable: true) { |employee_attendance| employee_attendance.in_time }
      column(:Company_Out_Min_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:out_min_time) }
      column(:Company_Out_Max_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:out_max_time) }
      column(:Company_Out_Time, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:out_time) }
      column(:Employee_Out_Time, sortable: true) { |employee_attendance| employee_attendance.machine_attendance.try(:out) }
      column(:Out_Time, sortable: true) { |employee_attendance| employee_attendance.out_time}
      column(:Company_Master_Hrs, sortable: true) { |employee_attendance| employee_attendance.company_time_master.try(:working_hrs).to_f.round(2) }
      column(:Working_Hrs, sortable: true) { |employee_attendance| employee_attendance.working_hrs.to_f.round(2) }
      # column(:Shift, sortable: true) { |employee_attendance| employee_attendance.company_time_master.shift_master.try(:name) }
      column(:Difference_Hrs, sortable: true) { |employee_attendance| employee_attendance.difference_hrs.to_f.round(2) }
      column(:Overtime_Hrs, sortable: true) { |employee_attendance| employee_attendance.overtime_hrs.to_f.round(2) }
      column(:Late_Mark, sortable: true) { |employee_attendance| employee_attendance.late_mark }
      column(:Status, sortable: true) { |employee_attendance| employee_attendance.present }
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end


  # def create_self_attendance
  #   @employee_attendance = EmployeeAttendance.new(employee_attendance_params)
  #   employee_id = params[:salary][:employee_id]
  #   day = params[:salary][:day]
  #   present = params[:salary][:present]
  #   @emp = Employee.find_by(id: employee_id)
  #   if @employee_attendance.is_present(day,employee_id)
  #     flash[:notice] = "Already Exist"
  #   else
  #     EmployeeAttendance.create(employee_id: employee_id,day: day,present: present, is_confirm: false)  
  #     flash[:notice] = "Created successfully"
  #   end
  # end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee_attendance
    @employee_attendance = EmployeeAttendance.find(params[:id])
  end

  def check_params
    if params[:employees].nil?
      flash[:alert] = "Please Select employees checkbox."
      redirect_to employee_attendances_path
    end 
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_attendance_params
    params.require(:employee_attendance).permit(:employee_code,:employee_name,:employee_id, :day, :present, :in_time, :out_time)
  end
end
