class LeaveStatusRecordsController < ApplicationController
  before_action :set_employee_leav_request, only: [:cancel, :first_approve, :second_approve, :first_reject, :second_reject]
  def cancel
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = "Cancelled"
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do 
      if @leave_status.save
        @employee_leav_request.update(is_cancelled: true, current_status: "Cancelled")
        flash[:notice] = "Leave Cancelled Successfully."
        redirect_to employee_leav_requests_path
      else
        flash[:alert] = "Leave Already cancelled. Please refresh page."
        redirect_to employee_leav_requests_path
      end  
    end    
  end

  def first_approve
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = "FirstApproved"
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do 
      if @leave_status.save
        @employee_leav_request.update(is_first_approved: true, current_status: "FirstApproved")
        flash[:notice] = "Leave Approved Successfully."
        redirect_to employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Approved. Please refresh page."
        redirect_to employee_leav_requests_path
      end
    end
  end

  def second_approve
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = "SecondApproved"
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do 
      if @leave_status.save
        @employee_leav_request.update(is_second_approved: true, current_status: "SecondApproved")
        flash[:notice] = "Leave Approved Successfully."
        redirect_to employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Approved. Please refresh page."
        redirect_to employee_leav_requests_path
      end
    end
  end

  def first_reject
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = "FirstRejected"
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do 
      if @leave_status.save
        @employee_leav_request.update(is_first_reject: true, current_status: "FirstRejected")
        flash[:notice] = "Leave Rejected Successfully."
        redirect_to employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Rejected. Please refresh page."
        redirect_to employee_leav_requests_path
      end
    end
  end

  def second_reject
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = "SecondRejected"
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do 
      if @leave_status.save
        @employee_leav_request.update(is_second_reject: true, current_status: "SecondRejected")
        flash[:notice] = "Leave Rejected Successfully."
        redirect_to employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Rejected. Please refresh page."
        redirect_to employee_leav_requests_path
      end
    end
  end

  private

  def set_employee_leav_request
    @employee_leav_request = EmployeeLeavRequest.find(params[:id])
  end
end
