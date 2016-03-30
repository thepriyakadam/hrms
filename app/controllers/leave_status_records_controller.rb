class LeaveStatusRecordsController < ApplicationController
  before_action :set_employee_leav_request, only: [:cancel, :first_approve, :second_approve, :first_reject, :second_reject]
  def cancel
    if @employee_leav_request.current_status == "Pending"
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = "Cancelled"
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_cancelled: true, current_status: "Cancelled")
          @employee_leav_request.revert_leave(@employee_leav_request)
          if @employee_leav_request.first_reporter.email.nil? or @employee_leav_request.first_reporter.email == ""
            flash[:notice] = "Leave Cancelled Successfully without email."
          else
            LeaveRequestMailer.cancel(@employee_leav_request).deliver_now
            flash[:notice] = "Leave Cancelled Successfully."
          end
          redirect_to employee_leav_requests_path
        else
          flash[:alert] = "Leave Already cancelled. Please refresh page."
          redirect_to employee_leav_requests_path
        end
      end
    else
      flash[:alert] = "Leave not cancelled. It may be approve or reject."
      redirect_to employee_leav_requests_path
    end
  end

  def first_approve
    ### if no second reporter available
    if @employee_leav_request.employee.manager_2_id.nil?
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = "FirstApproved"
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_first_approved: true, current_status: "FirstApproved")
          @employee_leav_request.create_single_record_for_leave(@employee_leav_request)
          #@employee_leav_request.minus_leave(@employee_leav_request)
          if @employee_leav_request.employee.email.nil? or @employee_leav_request.employee.email == ""
            flash[:notice] = "Leave Approved Successfully without email."
          else
            LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
            flash[:notice] = "Leave Approved Successfully."
          end
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        else
          flash[:alert] = "Leave Already Approved. Please refresh page."
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        end
      end
    ### if second reporter available  
    else
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = "FirstApproved"
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_first_approved: true, current_status: "FirstApproved", second_reporter_id: @employee_leav_request.employee.manager_2_id)
          if @employee_leav_request.first_reporter.email.nil? or @employee_leav_request.first_reporter.email == ""
            flash[:notice] = "Leave Approved Successfully without email."
          else
            LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
            flash[:notice] = "Leave Approved Successfully."
          end
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        else
          flash[:alert] = "Leave Already Approved. Please refresh page."
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        end
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
        @employee_leav_request.create_single_record_for_leave(@employee_leav_request)
        #@employee_leav_request.minus_leave(@employee_leav_request)
        if @employee_leav_request.employee.email.nil? or @employee_leav_request.employee.email == "" 
          flash[:notice] = "Leave Approved Successfully without mail."
        else
          flash[:notice] = "Leave Approved Successfully."
          LeaveRequestMailer.second_approve(@employee_leav_request).deliver_now
        end
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Approved. Please refresh page."
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
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
        @employee_leav_request.update(is_first_rejected: true, current_status: "FirstRejected")
        @employee_leav_request.revert_leave(@employee_leav_request)
        if @employee_leav_request.first_reporter.email.nil? or @employee_leav_request.first_reporter.email == ""
          flash[:notice] = "Leave Rejected Successfully without email."
        else
          flash[:notice] = "Leave Rejected Successfully."
          LeaveRequestMailer.first_reject(@employee_leav_request).deliver_now
        end
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Rejected. Please refresh page."
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
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
        @employee_leav_request.update(is_second_rejected: true, current_status: "SecondRejected")
        @employee_leav_request.revert_leave(@employee_leav_request)
        if @employee_leav_request.first_reporter.email.nil? or @employee_leav_request.first_reporter.email == ""
          flash[:notice] = "Leave Rejected Successfully without email."
        else
          flash[:notice] = "Leave Rejected Successfully."
          LeaveRequestMailer.second_reject(@employee_leav_request).deliver_now
        end
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
      else
        flash[:alert] = "Leave Already Rejected. Please refresh page."
        redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
      end
    end
  end

  def cancel_after_approve
    @particular_leave_record = ParticularLeaveRecord.find(params[:format])
    @particular_leave_record.is_cancel_after_approve = true

    @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @particular_leave_record.employee_id, leav_category_id: @particular_leave_record.leav_category_id).take
    if @particular_leave_record.is_full
      @employee_leav_balance.no_of_leave = @employee_leav_balance.no_of_leave.to_f + 1
    else
      @employee_leav_balance.no_of_leave = @employee_leav_balance.no_of_leave.to_f + 0.5
    end
    ActiveRecord::Base.transaction do
      @employee_leav_balance.save
      @particular_leave_record.save
    end
    flash[:notice] = "Leave Cancelled Successfully."
    redirect_to show_leave_record_particular_leave_records_path(format: @particular_leave_record.employee_leav_request_id)
  end

  private

  def set_employee_leav_request
    @employee_leav_request = EmployeeLeavRequest.find(params[:id])
  end
end