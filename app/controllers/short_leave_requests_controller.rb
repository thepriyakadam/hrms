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
    emp = Employee.find_by(id: current_user.employee_id)
    @manager = emp.manager_id
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
        @short_leave_request = ShortLeaveRequest.new
        @short_leave_requests = ShortLeaveRequest.all
        @flag=true
      else
        @flag=false
      end
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
    @short_leave_request.destroy
    @short_leave_requests = ShortLeaveRequest.all
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
