class EmployeeLeavRequestsController < ApplicationController
  before_action :set_employee_leav_request, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  # GET /employee_leav_requests
  # GET /employee_leav_requests.json
  def index
    @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', current_user.employee_id)
    #@employee_leav_requests = EmployeeLeavRequest.all
  end

  # GET /employee_leav_requests/1
  # GET /employee_leav_requests/1.json
  def show
  end

  # GET /employee_leav_requests/new
  def new
    @employee_leav_request = EmployeeLeavRequest.new
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', current_user.employee_id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
  end

  # GET /employee_leav_requests/1/edit
  def edit
  end

  # POST /employee_leav_requests
  # POST /employee_leav_requests.json
  def create
    @employee_leav_request = EmployeeLeavRequest.new(employee_leav_request_params)
    @employee = Employee.find(@employee_leav_request.employee_id)
    date_arr = params["employee_leav_request"]["date_range"].split('-')
    @employee_leav_request.start_date = date_arr[0].rstrip
    @employee_leav_request.end_date = date_arr[1].lstrip

    @employee_leav_request.first_reporter_id = 4605
    @employee_leav_request.second_reporter_id = 4606
    @employee_leav_request.is_pending = true
    @employee_leav_request.current_status = "Pending"
    
    if @employee_leav_request.leave_type == "Full Day"
      @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
    else
      @employee_leav_request.leave_count = 0.5
    end
    @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ?',@employee.id, @employee_leav_request.leav_category_id).take
    if @emp_leave_bal.nil?
      @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
      flash.now[:alert] = 'Leav balance not set- contact to admin.'
      render :new
    else
      if @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
      @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
      flash.now[:alert] = 'Not Allowed. You exceed the leave limit.'
      render :new
      else
        respond_to do |format|
          if @employee_leav_request.save
            format.html { redirect_to @employee_leav_request, notice: 'Employee leav request was successfully created.' }
            format.json { render :show, status: :created, location: @employee_leav_request }
          else
            format.html { render :new }
            format.json { render json: @employee_leav_request.errors, status: :unprocessable_entity }
          end
        end
      end  
    end
  end

  # PATCH/PUT /employee_leav_requests/1
  # PATCH/PUT /employee_leav_requests/1.json
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

  # DELETE /employee_leav_requests/1
  # DELETE /employee_leav_requests/1.json
  def destroy
    @employee_leav_request.destroy
    respond_to do |format|
      format.html { redirect_to employee_leav_requests_url, notice: 'Employee leav request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approved_or_rejected_leave_request
    if current_user.class == Group
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true)  
    else
      @pending_employee_leav_requests = EmployeeLeavRequest.where(is_pending: true)
      @first_approved_employee_leav_requests = EmployeeLeavRequest.where(is_first_approved: true, first_reporter_id: current_user.employee_id)
    end
    #@employee_leav_requests = EmployeeLeavRequest.joins("LEFT JOIN leav_approveds ON employee_leav_requests.id = leav_approveds.employee_leav_request_id LEFT JOIN leav_cancelleds ON employee_leav_requests.id = leav_cancelleds.employee_leav_request_id LEFT JOIN leav_rejecteds ON employee_leav_requests.id = leav_rejecteds.employee_leav_request_id where leav_approveds.id IS NULL AND leav_rejecteds.id IS NULL AND leav_cancelleds.id IS NULL")
  end

  def employee_list
    @employees = Employee.all
  end

  def from_hr
    @employee = Employee.find(params[:id])
    @employee_leav_request = EmployeeLeavRequest.new
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @remain_leaves = EmployeeLeavRequest.joins(:leav_approved)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_leav_request
      @employee_leav_request = EmployeeLeavRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_leav_request_params
      params.require(:employee_leav_request).permit(:employee_id, :leav_category_id, :leave_type, :date_range, :start_date, :end_date, :reason)
    end
end
