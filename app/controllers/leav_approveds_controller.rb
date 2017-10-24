class LeavApprovedsController < ApplicationController
  # ##load_and_authorize_resource
  # POST /leav_aproveds
  # POST /leav_aproveds.json
  def create
    @emp_leave_request = EmployeeLeavRequest.find(params[:format])
    ActiveRecord::Base.transaction do
      @emp_leave_request.create_leav_approved(approved_date: Date.today, employee_id: @emp_leave_request.employee_id)
      @employee_leav_balance = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ?', @emp_leave_request.employee_id, @emp_leave_request.leav_category_id).take
      count = @employee_leav_balance.no_of_leave.to_f - @emp_leave_request.leave_count
      @employee_leav_balance.update(no_of_leave: count)
      flash[:notice] = 'Leave approved successfully'
      redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def leav_aproved_params
    params.require(:leav_approved).permit(:employee_leav_request_id, :employee_id, :approved_date)
  end
end
