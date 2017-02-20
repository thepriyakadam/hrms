class OdStatusRecordsController < ApplicationController
  before_action :set_on_duty_request, only: [:cancel, :first_approve, :second_approve, :first_reject, :second_reject]

  def first_approve
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	if @on_duty_request.employee.manager_2_id.nil?
  		@on_duty_request.update(is_first_approved: true,current_status: 'FinalApproved')
  		OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FinalApproved')
  		OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FinalApproved',change_date: Date.today)
  		@on_duty_request.create_for_particular_od_record(@on_duty_request)
      @on_duty_request.create_od_in_attendance
      OdRequestMailer.first_approve1(@on_duty_request).deliver_now
  	else #manager_2 available
  		@on_duty_request.update(is_first_approved: true,current_status: 'FirstApproved',second_reporter_id: @on_duty_request.employee.manager_2_id)
  		OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FirstApproved')
  		OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FirstApproved',change_date: Date.today)
  	  OdRequestMailer.first_approve(@on_duty_request).deliver_now
    end	
  	flash[:notice] = "Approved Successfully"
  	redirect_to request_approval_list_on_duty_requests_path
  end

  def second_approve
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	@on_duty_request.update(is_second_approved: true,current_status: 'FinalApproved')
  	OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FinalApproved')
  	OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FinalApproved',change_date: Date.today)
  	@on_duty_request.create_for_particular_od_record(@on_duty_request)
    @on_duty_request.create_od_in_attendance
    OdRequestMailer.second_approve(@on_duty_request).deliver_now
  	flash[:notice] = "Approved Successfully"
  	redirect_to request_approval_list_on_duty_requests_path
  end
  
  def first_reject
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	@on_duty_request.update(is_first_rejected: true,current_status: 'Rejected')
  	OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Rejected')
  	OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Rejected',change_date: Date.today)
  	OdRequestMailer.first_reject(@on_duty_request).deliver_now

  	flash[:alert] = "Rejected Successfully"
  	redirect_to request_approval_list_on_duty_requests_path
  end

  def second_reject
    @on_duty_request = OnDutyRequest.find(params[:id])
    @on_duty_request.update(is_second_rejected: true,current_status: 'Rejected')
    OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Rejected')
    OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Rejected',change_date: Date.today)
    OdRequestMailer.second_reject(@on_duty_request).deliver_now
    flash[:alert] = "Rejected Successfully"
    redirect_to request_approval_list_on_duty_requests_path
  end

  def cancel
    @on_duty_request = OnDutyRequest.find(params[:id])
    @on_duty_request.update(is_cancelled: true,current_status: 'Cancelled')
    OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Cancelled')
    OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Cancelled',change_date: Date.today)
    if @on_duty_request.first_reporter.email.nil? || @on_duty_request.first_reporter.email == ''
      flash[:notice] = 'Leave Cancelled Successfully without email.'
    else
      OdRequestMailer.cancel(@on_duty_request).deliver_now
      flash[:notice] = 'Od Cancelled Successfully.'
    end
    flash[:alert] = "Cancelled Successfully"
    redirect_to on_duty_requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_on_duty_request
      @on_duty_request = OnDutyRequest.find(params[:id])
    end
end
