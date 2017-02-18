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
          if @on_duty_request.last_half == true && @on_duty_request.last_half == true
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

        flash[:notice] = "Request Created Successfully"
        if current_user.employee_id == @on_duty_request.employee_id
          redirect_to new_on_duty_request_path
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
    session[:active_tab1] ="LeaveProcess"
  end

  def employee_od_request_detail
    @current_request = OnDutyRequest.find(params[:format])
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
    @on_duty_request = OnDutyRequest.new
  end

  def hr_view_request
    @employee = Employee.find(params[:format])
    @on_duty_requests = OnDutyRequest.where(employee_id: @employee.id).order("id DESC")
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
