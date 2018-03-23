class OdStatusRecordsController < ApplicationController
  before_action :set_on_duty_request, only: [:cancel, :first_approve, :second_approve, :first_reject, :second_reject]

  def first_approve
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	if @on_duty_request.employee.manager_2_id.nil?
  		@on_duty_request.update(is_first_approved: true,current_status: 'FinalApproved')
  		OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FinalApproved')
  		OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FinalApproved',change_date: Date.today)
  		#@on_duty_request.create_for_particular_od_record(@on_duty_request)
      @on_duty_request.create_od_in_attendance
       OdRequestMailer.first_approve_final(@on_duty_request).deliver_now
  	else #manager_2 available
  		@on_duty_request.update(is_first_approved: true,current_status: 'FirstApproved',second_reporter_id: @on_duty_request.employee.manager_2_id)
  		OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FirstApproved')
  		OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FirstApproved',change_date: Date.today)
  	   OdRequestMailer.first_approve(@on_duty_request).deliver_now
    end	
  	flash[:notice] = "Approved Successfully"
    if @on_duty_request.first_reporter_id == current_user.employee_id
  	 redirect_to request_approval_list_on_duty_requests_path
    else
      redirect_to od_request_list_on_duty_requests_path
    end
  end

  def second_approve
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	@on_duty_request.update(is_second_approved: true,current_status: 'FinalApproved')
  	OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'FinalApproved')
  	OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'FinalApproved',change_date: Date.today)
  	#@on_duty_request.create_for_particular_od_record(@on_duty_request)
    @on_duty_request.create_od_in_attendance
     OdRequestMailer.second_approve(@on_duty_request).deliver_now
  	flash[:notice] = "Approved Successfully"
  	if @on_duty_request.first_reporter_id == current_user.employee_id
     redirect_to request_approval_list_manager_self_services_path
    else
      redirect_to od_request_list_on_duty_requests_path
    end
  end
  
  def first_reject
  	@on_duty_request = OnDutyRequest.find(params[:id])
  	@on_duty_request.update(is_first_rejected: true,current_status: 'Rejected')
  	OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Rejected')
  	OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Rejected',change_date: Date.today)
  	 OdRequestMailer.first_reject(@on_duty_request).deliver_now

  	flash[:notice] = "Rejected Successfully"
  	if @on_duty_request.first_reporter_id == current_user.employee_id
     redirect_to request_approval_list_on_duty_requests_path
    else
      redirect_to od_request_list_on_duty_requests_path
    end
  end

  def second_reject
    @on_duty_request = OnDutyRequest.find(params[:id])
    @on_duty_request.update(is_second_rejected: true,current_status: 'Rejected')
    OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Rejected')
    OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Rejected',change_date: Date.today)
     OdRequestMailer.second_reject(@on_duty_request).deliver_now
    flash[:notice] = "Rejected Successfully"
    if @on_duty_request.first_reporter_id == current_user.employee_id
     redirect_to request_approval_list_manager_self_services_path
    else
      redirect_to od_request_list_on_duty_requests_path
    end
  end

  def cancel
    @on_duty_request = OnDutyRequest.find(params[:id])
    @on_duty_request.update(is_cancelled: true,current_status: 'Cancelled')
    OdRecord.where(on_duty_request_id: @on_duty_request.id).update_all(status: 'Cancelled')
    EmployeeAttendance.where(on_duty_request_id: @on_duty_request.id).update_all(on_duty_request_id: nil,present: "A",comment: "OD request cancelled")
    OdStatusRecord.create(on_duty_request_id: @on_duty_request.id,employee_id: current_user.employee_id,status: 'Cancelled',change_date: Date.today)
    if @on_duty_request.first_reporter.email.nil? || @on_duty_request.first_reporter.email == ''
      flash[:notice] = 'Leave Cancelled Successfully without email.'
    else
       OdRequestMailer.cancel(@on_duty_request).deliver_now
      flash[:notice] = 'OD Cancelled Successfully.'
    end
    if @on_duty_request.employee_id == current_user.employee_id
      redirect_to on_duty_requests_path
    else
      redirect_to hr_view_request_on_duty_requests_path(@on_duty_request.employee_id)
    end
  end

  def cancel_after_approve
    @particular_od_record = ParticularOdRecord.find(params[:format])
    @on_duty_request = OnDutyRequest.find_by_employee_id(@particular_od_record.employee_id)
    @current_emp = current_user.employee_id
    
    @date = @particular_od_record.leave_date.strftime("%Y-%m-%d")
    OdRecord.where("on_duty_request_id =? AND day =?", @particular_od_record.on_duty_request_id, @date).update_all(status: "Cancelled")
    @particular_od_record.update(is_cancel_after_approve: true)
    #EmployeeAttendance.where("employee_id = ? AND day = ?", @particular_od_record.employee_id,@particular_od_record.leave_date.to_date).destroy_all    
    EmployeeAttendance.where(on_duty_request_id: @particular_od_record.on_duty_request_id).update_all(on_duty_request_id: nil,present: "A",comment: "OD cancelled after approve")
      if @on_duty_request.employee.email.nil? || @on_duty_request.employee.email == ''
        flash[:notice] = 'OD Cancelled Successfully without email.'
      else
        flash[:notice] = 'OD Cancelled Successfully.'
         OdRequestMailer.cancel_after_approve(@particular_od_record,@current_emp).deliver_now
      end
      redirect_to show_od_record_on_duty_requests_path(format: @particular_od_record.on_duty_request_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_on_duty_request
      @on_duty_request = OnDutyRequest.find(params[:id])
    end
end
