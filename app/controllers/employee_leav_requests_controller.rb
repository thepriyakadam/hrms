require 'query_report/helper'  # need to require the helper
class EmployeeLeavRequestsController < ApplicationController
  before_action :set_employee_leav_request, only: [:show, :edit,:update, :destroy]
  load_and_authorize_resource
  include QueryReport::Helper  # need to include it

  def index
    @employee = Employee.find(current_user.employee_id)
    @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', current_user.try(:employee_id))
    @employee_leav_balances = EmployeeLeavBalance.where(employee_id: current_user.employee_id)
    session[:active_tab] ="EmployeeSelfService"
  end

  def show
  end

  def new
    @employee_leav_request = EmployeeLeavRequest.new
    @employee = Employee.find(current_user.employee_id)
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', current_user.employee_id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id)
  end

  def edit
  end

  def create
    @employee_leav_request = EmployeeLeavRequest.new(employee_leav_request_params)
    @employee = Employee.find(@employee_leav_request.employee_id)
    start_date = params['employee_leav_request']['start_date']
    end_date = params['employee_leav_request']['end_date']
    # date_arr = params['employee_leav_request']['date_range'].split('-')
    # @employee_leav_request.start_date = date_arr[0].rstrip
    # @employee_leav_request.end_date = date_arr[1].lstrip
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id)
    @leav_category = LeavCategory.find(@employee_leav_request.leav_category_id)
    # date_range = params['employee_leav_request']['date_range']
    # @date = params['employee_leav_request']['date_range']
    @emp_leav_req = EmployeeLeavRequest.where(employee_id: @employee.id, start_date: start_date,end_date: end_date)
      if params[:flag] == "Full/Half"
        @employee_leav_request.last_half = params[:common][:last_half]
        @employee_leav_request.first_half = params[:common][:first_half]
        @checkbox = true
      else
        @checkbox = false
      end

    if @employee_leav_request.end_date == nil 
      flash[:alert] = "please Fill all mendatory fields"
      redirect_to new_employee_leav_request_path
    else
      for i in @employee_leav_request.start_date.to_date..@employee_leav_request.end_date.to_date
        @employee_leav_request.leave_records.build(employee_id: @employee_leav_request.employee_id,employee_leav_request_id: @employee_leav_request.id,status: "Pending", day: i)
      end

      if @employee_leav_request.is_available?
        flash[:alert] = "Your Leave Request already has been sent status is pending"
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      elsif @employee_leav_request.is_available1?
        flash[:alert] = "Your Leave Request already has been sent status is First Approved"
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      elsif @employee_leav_request.is_available2?
        flash[:alert] = "Request already has Approved"
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      elsif @employee_leav_request.is_salary_processed?
        flash[:alert] = "Salary Processed for this month"
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      elsif @employee_leav_request.is_continue?
        flash[:alert] = "Leave Already Available !"
        redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
      else
        if @employee.manager_id.nil?
          flash[:alert] = 'Reporting manager not set please set Reporting Manager'
          redirect_to root_url
        else
          @employee_leav_request.first_reporter_id = @employee.manager_id
          @employee_leav_request.is_pending = true
          @employee_leav_request.current_status = 'Pending'
          if @employee_leav_request.leave_type == 'Full Day'
            @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
          
          elsif @employee_leav_request.leave_type == 'Full/Half'
            if @employee_leav_request.first_half == true && @employee_leav_request.last_half == true
              @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f
            elsif @employee_leav_request.first_half == true
              @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
            elsif @employee_leav_request.last_half == true
              @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
            else
              @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
            end
          else
            @employee_leav_request.leave_count = 0.5
          end
          @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
          type = LeavCategory.find(@employee_leav_request.leav_category_id).is_payble
          if type == false
            @employee_leav_request.save
            @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id,status: "Pending", change_date: Date.today)
            if @employee.manager.email.nil? or @employee.manager.email == ""
              flash[:notice] = "Send request without email."
            else
              flash[:notice] = 'Leave Request sent successfully.'
              LeaveRequestMailer.pending(@employee_leav_request).deliver_now
            end
            redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
          else
            @leave_category = LeavCategory.where(id: @employee_leav_request.leav_category_id,is_active: true).take
            if @leave_category.is_balance == true
              if @emp_leave_bal.nil?
                @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                flash.now[:alert] = 'Leave balance not set- contact to admin.'
                render :new
      
              elsif @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
                @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                flash.now[:alert] = 'Not Allowed. You exceed the leave limit.'
                render :new

              elsif @leav_category.from.nil? or @leav_category.to.nil?
                @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                if @employee_leav_request.save
                  @employee_leav_request.minus_leave(@employee_leav_request)
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    flash[:notice] = 'Send request without email.'
                  else
                    flash[:notice] = 'Leave Request sent successfully..'
                    LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                  redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                else
                  render :new
                end
              elsif
                @employee_leav_request.leave_count < @leav_category.from or @employee_leav_request.leave_count > @leav_category.to 
                @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                flash.now[:alert] = 'You are not in limit.'
                render :new
                #@leave_coff = LeaveCOff.where(employee_id: @employee.id)
              elsif type == 'C.Off'
                @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                if @employee_leav_request.save
                  #@employee_leav_request.manage_coff(@employee_leav_request)
                  @employee_leav_request.minus_leave(@employee_leav_request)
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    flash[:notice] = 'Send request without email.'
                  else
                    flash[:notice] = 'Leave Request sent successfully !!'
                    #LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                  redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                else
                  render :new
                end
              else
                @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                if @employee_leav_request.save
                  @employee_leav_request.minus_leave(@employee_leav_request)
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    flash[:notice] = 'Send request without email.'
                  else
                    flash[:notice] = 'Leave Request sent successfully !'
                    LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                  redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                else
                  render :new
                end
              end
            else
               @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                if @employee_leav_request.save
                  @employee_leav_request.minus_leave(@employee_leav_request)
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    flash[:notice] = 'Send request without email.'
                  else
                    flash[:notice] = 'Leave Request sent successfully !'
                    LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                  redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                else
                  render :new
                end
            end
          end
        end
      end 
    end #for   
  end

  def update
    respond_to do |format|
      if @employee_leav_request.update(employee_leav_request_params)
        format.html { redirect_to @employee_leav_request, notice: 'Employee leav request was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_leav_request }
      else
        format.html { render :edit }
        format.json { render json: @employee_leav_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_leav_request.destroy
    respond_to do |format|
      format.html { redirect_to employee_leav_requests_url, notice: 'Employee leav request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approved_or_rejected_leave_request
    if current_user.class == Group
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil)
    else
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil, first_reporter_id: current_user.employee_id)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil, second_reporter_id: current_user.employee_id)
    end
    # @employee_leav_requests = EmployeeLeavRequest.joins("LEFT JOIN leav_approveds ON employee_leav_requests.id = leav_approveds.employee_leav_request_id LEFT JOIN leav_cancelleds ON employee_leav_requests.id = leav_cancelleds.employee_leav_request_id LEFT JOIN leav_rejecteds ON employee_leav_requests.id = leav_rejecteds.employee_leav_request_id where leav_approveds.id IS NULL AND leav_rejecteds.id IS NULL AND leav_cancelleds.id IS NULL")
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end

  def all_leave_request_list
    if current_user.class == Group
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil)
    else
      @first_level_request_lists = EmployeeLeavRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil)
      @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: nil).pluck(:second_reporter_id)
      @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil,second_reporter_id: @emp_leav_req)
    end
    # @employee_leav_requests = EmployeeLeavRequest.joins("LEFT JOIN leav_approveds ON employee_leav_requests.id = leav_approveds.employee_leav_request_id LEFT JOIN leav_cancelleds ON employee_leav_requests.id = leav_cancelleds.employee_leav_request_id LEFT JOIN leav_rejecteds ON employee_leav_requests.id = leav_rejecteds.employee_leav_request_id where leav_approveds.id IS NULL AND leav_rejecteds.id IS NULL AND leav_cancelleds.id IS NULL")
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end

  def employee_list
    if current_user.class == Group
      @employees = Employee.all
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveProcess"
  end

  def from_hr
    @employee = Employee.find(params[:format])
    @employee_leav_request = EmployeeLeavRequest.new
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id, is_taken: false).order("expiry_date desc")
  end

  def hr_view_request
    @employee = Employee.find(params[:format])
    @employee_leav_requests = @employee.employee_leav_requests
  end

  def employee_history_with_current_leave
    @current_request = EmployeeLeavRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @employee_leav_requests = @employee.employee_leav_requests
  end

  def admin_employee_history_with_current_leave
    @current_request = EmployeeLeavRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @employee_leav_requests = @employee.employee_leav_requests
  end

  def search_by_start_date
    reporter(EmployeeLeavRequest.filter_records(current_user), template_class: PdfReportTemplate) do
      filter :start_date, type: :date
      # filter :current_status, type: :string
      #column(:Request_ID, sortable: true) { |employee_leav_request| employee_leav_request.id }
      column(:ID, sortable: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
      column(:Employee_Name, sortable: true) { |employee_leav_request| full_name(employee_leav_request.employee) }
      column(:Designation, sortable: true) { |employee_leav_request| employee_leav_request.employee.joining_detail.try(:employee_designation).try(:name) }
      column(:From, sortable: true) { |employee_leav_request| employee_leav_request.start_date.to_date }
      column(:To, sortable: true) { |employee_leav_request| employee_leav_request.end_date.to_date }
      column(:Leave_Category, sortable: true) { |employee_leav_request| employee_leav_request.leav_category.try(:description) }
      column(:Apply_Date, sortable: true) { |employee_leav_request| employee_leav_request.created_at.to_date }
      column(:Apply_Time, sortable: true) { |employee_leav_request| employee_leav_request.created_at }
      column(:Leave_Type, sortable: true, &:leave_type)
      column(:Status, sortable: true, &:current_status)
      column(:No_OF_Day, sortable: true, &:leave_count)
      column(:Reason, sortable: true, &:reason)
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end

  def search_by_is_pending_date
    reporter(@employee_leav_requests, template_class: PdfReportTemplate) do
      filter :current_status, type: :string
      # filter(:current_status, :enum, :select => [["Pending",0],["Cancelled",1],["FirstApproved",2],["SecondApproved",3],["FirstRejected",4],["SecondRejected",5]])
      column(:Employee_ID, sortable: true) { |employee_leav_request| employee_leav_request.employee.try(:manual_employee_code) }
      column(:Emploee_name, sortable: true) { |employee_leav_request| full_name(employee_leav_request.employee) }
      column :current_status
    end
  end

  def select_checkbox
    if params[:leave_type] == "Full/Half" || params[:leave_type] == "Half Day"
      @flag = true
    else
      @flag = false
    end
  end

  def leave_request_report
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end
  
  def request_report
    @start_date = params[:employee_leav_request] ? params[:employee_leav_request][:start_date] : params[:start_date]
    @end_date = params[:employee_leav_request] ? params[:employee_leav_request][:end_date] : params[:end_date]
    @company_id = params[:employee_leav_request] ? params[:employee_leav_request][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
  
    if current_user.class == Group
      if @company_id == ""
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      end

    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @salaryslips = Salaryslip.where(month:  @month,year: @year.to_s,employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_requests/leave_request.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'request_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_requests/leave_request.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
  
  def leave_req_status_report
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="LeaveReports"
  end

  def status_wise_request
    @start_date = params[:employee_leav_request] ? params[:employee_leav_request][:start_date] : params[:start_date]
    @end_date = params[:employee_leav_request] ? params[:employee_leav_request][:end_date] : params[:end_date]
    @company = params[:employee_leav_request] ? params[:employee_leav_request][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @status = params[:employee_leav_request] ? params[:employee_leav_request][:current_status] : params[:current_status]
    
    if @status == "Pending"
      @current_status = 0
    elsif @status == "FinalApproved"
      @current_status = 3
    elsif @status == "FirstApproved"
      @current_status = 2
    elsif @status == "Cancelled"
      @current_status = 1
    elsif @status == "Rejected"
      @current_status = 4
    end
    
    if current_user.class == Group
      if @company == ""
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      end

    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @employee_leav_requests = EmployeeLeavRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'employee_leav_requests/status_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_leav_requests/status_wise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_leav_request
    @employee_leav_request = EmployeeLeavRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_leav_request_params
    params.require(:employee_leav_request).permit(:first_half,:last_half,:current_status,:current_status1,:employee_id, :leav_category_id, :leave_type, :date_range, :start_date, :end_date, :reason)
  end
end
