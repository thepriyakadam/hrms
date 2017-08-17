class LeaveTransfersController < ApplicationController
  before_action :set_leave_transfer, only: [:show, :edit, :update, :destroy]

  # GET /leave_transfers
  # GET /leave_transfers.json
  # def index
  #   @leave_transfers = LeaveTransfer.all
  # end

  # GET /leave_transfers/1
  # GET /leave_transfers/1.json
  def show
  end

  # GET /leave_transfers/new
  def new
    @leave_transfer = LeaveTransfer.new
    @leave_transfers = LeaveTransfer.all
  end

  # GET /leave_transfers/1/edit
  def edit
  end

  # POST /leave_transfers
  # POST /leave_transfers.json
  def create
    @leave_transfer = LeaveTransfer.new(leave_transfer_params)
    @leave_transfers = LeaveTransfer.all
    employee_id = leave_transfer_params["employee_id"]
    transfer_to_id = leave_transfer_params["transfer_to_id"]
    leav_category_id = leave_transfer_params["leav_category_id"]
    @no_of_leave = leave_transfer_params["no_of_leave"]
    employee = Employee.find_by(id: employee_id)

    employee_leav_balance = EmployeeLeavBalance.where(employee_id: current_user.employee_id,leav_category_id: leav_category_id,is_active: true).take
    unless employee_leav_balance.nil? 
      if employee_leav_balance.no_of_leave.to_f >= @no_of_leave.to_f && @no_of_leave.to_f <= 5
        @leave_transfer.save
        @leave_transfer.update(status: "Pending",employee_leav_balance_id: employee_leav_balance.id)
        
        leave = employee_leav_balance.no_of_leave.to_f - @no_of_leave.to_f
        employee_leav_balance.update(no_of_leave: leave)

       
        flash[:notice] = "Leave Transfered To #{employee.first_name}"
        redirect_to new_leave_transfer_path
      else
        flash[:alert] = "Leave Limit Extended!"
        redirect_to new_leave_transfer_path
      end
    end#unless
  end

  # PATCH/PUT /leave_transfers/1
  # PATCH/PUT /leave_transfers/1.json
  def update
    @leave_transfer.update(leave_transfer_params)
    @leave_transfer = LeaveTransfer.new
    @leave_transfers = LeaveTransfer.all
  end

  # DELETE /leave_transfers/1
  # DELETE /leave_transfers/1.json
  def destroy
     @leave_transfer
    employee_leav_balance = EmployeeLeavBalance.where(employee_id:  @leave_transfer.employee_id,leav_category_id:  @leave_transfer.leav_category_id,is_active: true).take
    leave = employee_leav_balance.no_of_leave.to_f + @no_of_leave.to_f
        employee_leav_balance.update(no_of_leave: leave)

    @leave_transfer.destroy
    @leave_transfers = LeaveTransfer.all
  end

  def leave_transfer_approval
    @pending_leave_transfers = LeaveTransfer.where(status: "Pending")
  end

  def show_detail_for_approval
    @current_request = LeaveTransfer.find(params[:format])
    @employee = Employee.find(@current_request.employee_id)
    @transfer_to = Employee.find(@current_request.transfer_to_id)
    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
    @leave_transfers =LeaveTransfer.where(employee_id: @employee.id).order("id DESC")
  end

  def approve
    current_request = LeaveTransfer.find(params[:current_request_id])
    transfer_to_balance = EmployeeLeavBalance.where(employee_id: current_request.transfer_to_id,leav_category_id: current_request.leav_category_id,is_active: true).take
    if transfer_to_balance.nil?
      EmployeeLeavBalance.create(employee_id: current_request.transfer_to_id,leav_category_id: current_request.leav_category_id,no_of_leave: current_request.no_of_leave,total_leave: current_request.no_of_leave,is_active: true)
    else
      @leave = transfer_to_balance.no_of_leave.to_f + current_request.no_of_leave.to_f
      transfer_to_balance.update(no_of_leave: @leave)
    end
    current_request.update(status: "Approved")
  end

  def reject
    current_request = LeaveTransfer.find(params[:current_request_id])
    employee_leav_balance = EmployeeLeavBalance.find_by(id: current_request.employee_leav_balance_id)
    @leave = employee_leav_balance.no_of_leave.to_f + current_request.no_of_leave.to_f
    employee_leav_balance.update(no_of_leave: @leave)
    current_request.update(status: "Approved")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_transfer
      @leave_transfer = LeaveTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_transfer_params
      params.require(:leave_transfer).permit(:leav_category_id,:employee_id, :transfer_to_id, :date, :no_of_leave, :status, :employee_leav_balance_id)
    end
end
