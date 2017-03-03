class OnDutyRequestsController < ApplicationController
  before_action :set_on_duty_request, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  # GET /on_duty_requests
  # GET /on_duty_requests.json
  def index
    @employee = Employee.find(current_user.employee_id)
    @on_duty_requests = OnDutyRequest.where('employee_id = ?', current_user.try(:employee_id)).order("id DESC")
    session[:active_tab] ="EmployeeSelfService"
  end

  # GET /on_duty_requests/1
  # GET /on_duty_requests/1.json
  def show
  end

  # GET /on_duty_requests/new
  def new
    @on_duty_request = OnDutyRequest.new
    @employee = Employee.find_by(id: current_user.employee_id)
  end

  # GET /on_duty_requests/1/edit
  def edit
  end

  # POST /on_duty_requests
  # POST /on_duty_requests.json
  def create
    @on_duty_request = OnDutyRequest.new(on_duty_request_params)
    @employee = Employee.find(@on_duty_request.employee_id)
      if params[:flag] == "Full/Half"
        @on_duty_request.last_half = params[:common][:last_half]
        @on_duty_request.first_half = params[:common][:first_half]
        @checkbox = true
      else
        @checkbox = false
      end

    if @on_duty_request.is_available?
      flash[:alert] = "Your Request already has been sent"
      if current_user.employee_id == @on_duty_request.employee_id
        redirect_to new_on_duty_request_path
      else
        redirect_to employee_list_on_duty_requests_path
      end
    else
      if @employee.manager_id.nil?
        flash[:alert] = 'Reporting manager not set please set Reporting Manager'
        if current_user.employee_id == @on_duty_request.employee_id
          redirect_to new_on_duty_request_path
        else
          redirect_to employee_list_on_duty_requests_path
        end
      else
        @on_duty_request.is_pending = true
        @on_duty_request.current_status = 'Pending'
        @on_duty_request.first_reporter_id = @employee.manager_id

        if @on_duty_request.leave_type == 'Full Day'
          @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 1
        elsif @on_duty_request.leave_type == 'Full/Half'
          if @on_duty_request.last_half == true && @on_duty_request.first_half == true
            @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f
          elsif @on_duty_request.first_half == true || @on_duty_request.last_half == true
            @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 0.5
          else
            @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 1
          end  
        elsif @on_duty_request.leave_type == 'Half Day'
          if @on_duty_request.first_half == true || @on_duty_request.last_half == true
            @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
          elsif @on_duty_request.last_half == true && @on_duty_request.last_half == true
            @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
          else
            @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
          end
        end
        @on_duty_request.save

        if @on_duty_request.leave_type == 'Half Day'
          if @on_duty_request.first_half == true && @on_duty_request.last_half == true
            @on_duty_request.update(first_half: true,last_half: false)
          elsif @on_duty_request.first_half == false && @on_duty_request.last_half == false
            @on_duty_request.update(first_half: true,last_half: false)
          else @on_duty_request.first_half == true || @on_duty_request.last_half == true
            @on_duty_request.save
          end
        end
        for i in @on_duty_request.start_date.to_date..@on_duty_request.end_date.to_date
          OdRecord.create(employee_id: @employee.id,on_duty_request_id: @on_duty_request.id,status: 'Pending',day: i)
        end
          OdStatusRecord.create(employee_id: @employee.id,on_duty_request_id: @on_duty_request.id,status: 'Pending',change_date: Date.today)

          if @employee.manager.email.nil? or @employee.manager.email == ""
              flash[:notice] = "Send request without email."
            else
              flash[:notice] = 'OD Request sent successfully.'
              OdRequestMailer.pending(@on_duty_request).deliver_now
            end

        flash[:notice] = "Request Created Successfully"
        if current_user.employee_id == @on_duty_request.employee_id
          redirect_to on_duty_requests_path
        else
          redirect_to employee_list_on_duty_requests_path
        end
      end #manager_id nil
    end #is_available
  end

  # PATCH/PUT /on_duty_requests/1
  # PATCH/PUT /on_duty_requests/1.json
  def update
    respond_to do |format|
      if @on_duty_request.update(on_duty_request_params)
        format.html { redirect_to @on_duty_request, notice: 'On duty request was successfully updated.' }
        format.json { render :show, status: :ok, location: @on_duty_request }
      else
        format.html { render :edit }
        format.json { render json: @on_duty_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /on_duty_requests/1
  # DELETE /on_duty_requests/1.json
  def destroy
    @on_duty_request.destroy
    respond_to do |format|
      format.html { redirect_to on_duty_requests_url, notice: 'On duty request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_checkbox
    if params[:leave_type] == "Full/Half" || params[:leave_type] == "Half Day"
      @flag = true
    else
      @flag = false
    end
  end
  
  def request_approval_list
    @emp = Employee.find(current_user.employee_id)
    @employees = @emp.subordinates
    @employees_ind = @emp.indirect_subordinates
    
    if current_user.class == Group
      @pending_on_duty_requests = OnDutyRequest.where(is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil,employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil,employee_id: @employees_ind)
    else
      @pending_on_duty_requests = OnDutyRequest.where(is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil,employee_id: @employees)
      @first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil,employee_id: @employees_ind)
    end
    
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="ODProcess"
  end

  def employee_od_request_detail
    @current_request = OnDutyRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @on_duty_requests = OnDutyRequest.where(employee_id: @employee).order("id DESC")

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
    session[:active_tab1] ="ODProcess"
  end

  def from_hr
    @employee = Employee.find(params[:format])
    @on_duty_request = OnDutyRequest.new
  end

  def hr_view_request
    @employee = Employee.find(params[:format])
    @on_duty_requests = OnDutyRequest.where(employee_id: @employee.id).order("id DESC")
  end

  def show_od_record
    @on_duty_request = OnDutyRequest.find(params[:format])
    @particular_od_records = @on_duty_request.particular_od_records
  end

  def od_request_list
    if current_user.class == Group
      @first_level_request_lists = OnDutyRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil)
    else
      @first_level_request_lists = OnDutyRequest.where(is_pending: true, is_first_approved: nil, is_first_rejected: nil, is_cancelled: nil)
      @on_duty_request = OnDutyRequest.where.not(second_reporter_id: nil).pluck(:second_reporter_id)
      @second_level_request_lists = OnDutyRequest.where(is_first_approved: true, is_second_approved: nil, is_second_rejected: nil, is_cancelled: nil,second_reporter_id: @on_duty_request)
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="ODProcess"
  end

  def employee_od_request_detil_for_admin
    @current_request = OnDutyRequest.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @on_duty_requests = OnDutyRequest.where(employee_id: @employee).order("id DESC")
  end

  def request_report
    @start_date = params[:employee] ? params[:employee][:start_date] : params[:start_date]
    @end_date = params[:employee] ? params[:employee][:end_date] : params[:end_date]
    @company_id = params[:employee] ? params[:employee][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
  
   @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)

    if current_user.class == Group
      if @company_id == ""
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'on_duty_requests/on_duty_request.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'request_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'on_duty_requests/on_duty_request.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="ODReports"
  end

  def status_wise_report_list
    @start_date = params[:employee] ? params[:employee][:start_date] : params[:start_date]
    @end_date = params[:employee] ? params[:employee][:end_date] : params[:end_date]
    @company = params[:employee] ? params[:employee][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
    @status = params[:employee] ? params[:employee][:current_status] : params[:current_status]
    
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
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
      elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
        @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
      end

    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
       else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @on_duty_request_id = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees).take
          @on_duty_requests = OnDutyRequest.where(start_date: @start_date.to_datetime..@end_date.to_datetime,current_status: @current_status).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end #current_user.role
    end #current_user.class

    respond_to do |f|
      f.js
      f.xls {render template: 'on_duty_requests/status_wise.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'status_wise_request',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'on_duty_requests/status_wise.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
    session[:active_tab] ="LeaveManagement"
    session[:active_tab1] ="ODReports"
  end

  def show_approved_record
     @start_date = params[:employee] ? params[:employee][:start_date] : params[:start_date]
    @end_date = params[:employee] ? params[:employee][:end_date] : params[:end_date]
    @company_id = params[:employee] ? params[:employee][:company_id] : params[:company_id]
    @location = params[:employee] ? params[:employee][:company_location_id] : params[:company_location_id]
    @department = params[:employee] ? params[:employee][:department_id] : params[:department_id]
  
    if current_user.class == Group
      if @company_id == ""
        @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).take
        @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime)
      elsif @location == ""
        @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
        @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      elsif @department == ""
        @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
        @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      else
        @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
        @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
        @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
      end
      
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company_id == ""
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company_id == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @location == ""
          @employees = Employee.where(company_id: @company_id.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company_id == "" || @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        elsif @department == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company_id == "" || @location == "" || @department == ""
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company_id.to_i,company_location_id: @location.to_i,department_id: @department.to_i).pluck(:id)
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Supervisor'
        if @company_id == "" || @location == "" || @department == ""
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @particular_od_record_id = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees).take
          @particular_od_records = ParticularOdRecord.where(leave_date: @start_date.to_datetime..@end_date.to_datetime).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'on_duty_requests/approved_record.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'show_approved_record',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'on_duty_requests/approved_record.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
      

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_on_duty_request
      @on_duty_request = OnDutyRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def on_duty_request_params
      params.require(:on_duty_request).permit(:employee_id, :leave_type, :start_date, :end_date, :no_of_day, :reason, :first_reporter_id, :second_reporter_id, :first_half, :last_half, :current_status, :is_pending, :is_cancelled, :is_first_approved, :is_second_approved, :is_first_rejected, :is_second_rejected)
    end
end
