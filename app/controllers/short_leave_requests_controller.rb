class ShortLeaveRequestsController < ApplicationController
  before_action :set_short_leave_request, only: [:show, :edit, :update, :destroy]

  # GET /short_leave_requests
  # GET /short_leave_requests.json
  def index
    @short_leave_requests = ShortLeaveRequest.all
  end

  # GET /short_leave_requests/1
  # GET /short_leave_requests/1.json
  def show
  end

  # GET /short_leave_requests/new
  def new
    @employee = Employee.find_by(id: current_user.employee_id)
    @manager = @employee.manager_id
    @short_leave_request = ShortLeaveRequest.new
    @short_leave_requests = ShortLeaveRequest.where(employee_id: current_user.employee_id)
  end

  # GET /short_leave_requests/1/edit
  def edit
  end

  # POST /short_leave_requests
  # POST /short_leave_requests.json
  def create
    @short_leave_request = ShortLeaveRequest.new(short_leave_request_params)
      if @short_leave_request.save
        #shrt_leave = @short_leave_request.save
        emp = Employee.find_by(id: @short_leave_request.employee_id)
        total_hrs = @short_leave_request.out_time.to_time - @short_leave_request.in_time.to_time
        working_hrs = Time.at(total_hrs).utc.strftime("%H:%M")
        @short_leave_request.update(count: working_hrs,status: "Pending",manager_id: emp.manager_id)

        ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: @short_leave_request.employee_id,
          status: "Pending")
        @short_leave_request = ShortLeaveRequest.new
        @short_leave_requests = ShortLeaveRequest.all
        @flag=true
      else
        @flag=false
      end
  end

  def approve
    @short_leave_request = ShortLeaveRequest.find(params[:format])
    ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: @short_leave_request.employee_id,
      status: "Approved")
    @short_leave_request.update(status: "Approved")
    flash[:notice] = "Short Leave Approved Successfully!"
    redirect_to short_leave_approval_manager_self_services_path
  end

  def reject
    @short_leave_request = ShortLeaveRequest.find(params[:format])
    ShortLeaveApproval.create(short_leave_request_id: @short_leave_request.id,employee_id: @short_leave_request.employee_id,
      status: "Rejected")
    @short_leave_request.update(status: "Rejected")
    flash[:alert] = "Short Leave Rejected Successfully!"
    redirect_to short_leave_approval_manager_self_services_path
  end

  def view_request
    @short_leave_request = ShortLeaveRequest.find(params[:format])
  end

  # PATCH/PUT /short_leave_requests/1
  # PATCH/PUT /short_leave_requests/1.json
  def update
    @short_leave_request.update(short_leave_request_params)
    @short_leave_request = ShortLeaveRequest.new
    @short_leave_requests = ShortLeaveRequest.all
  end

  # DELETE /short_leave_requests/1
  # DELETE /short_leave_requests/1.json
  def destroy
    @short_leave_request
    if ShortLeaveApproval.exists?(short_leave_request_id: @short_leave_request.id)
      flash[:alert] = "Record is created ! "
    else
    @short_leave_request.destroy
    @short_leave_requests = ShortLeaveRequest.all
    end
  end

  def show_leave

    @short_leave_request = ShortLeaveRequest.find(params[:format])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_leave_request
      @short_leave_request = ShortLeaveRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_leave_request_params
      params.require(:short_leave_request).permit(:employee_id, :day, :in_time, :out_time, :description, :manager_id, :status)
    end
end
