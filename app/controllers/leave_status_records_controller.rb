class LeaveStatusRecordsController < ApplicationController
  before_action :set_employee_leav_request, only: [:cancel, :first_approve, :second_approve, :first_reject, :second_reject]
  def cancel
    if @employee_leav_request.current_status == 'Pending'
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = 'Cancelled'
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_cancelled: true, current_status: 'Cancelled')
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Cancelled")
        #update_in_attendance
          @employee_attendance = EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id)
          @latemark_master = LatemarkMaster.last
          @employee_attendance.each do |e|
            if e.employee_week_off_id.present?  
              e.update(employee_leav_request_id: nil,present: "WO",comment: "Leave Cancelled/WeekOff")
            elsif e.holiday_id.present?  
              e.update(employee_leav_request_id: nil,present: "HP",comment: "Leave Cancelled/Holiday")
            elsif e.in_time.present? && e.out_time.present?
              if e.working_hrs < @latemark_master.halfday_working_hrs
                e.update(employee_leav_request_id: nil,present: "HD",comment: "Leave Cancelled/HalfDay")
              else  
                e.update(employee_leav_request_id: nil,present: "P",comment: "Leave Cancelled/Present")
              end #workking_hrs
            else  
            e.update(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled/Absent")
            end 
          end #do

          @employee_leav_request.revert_leave(@employee_leav_request)
          if @employee_leav_request.first_reporter.email.nil? || @employee_leav_request.first_reporter.email == ''
            flash[:notice] = 'Leave Cancelled Successfully without email.'
          else
             LeaveRequestMailer.cancel(@employee_leav_request).deliver_now
            flash[:notice] = 'Leave Cancelled Successfully.'
          end
          redirect_to hr_view_request_employee_leav_requests_path(@employee_leav_request.employee_id)
        else
          flash[:alert] = 'Leave Already cancelled. Please refresh page.'
          redirect_to hr_view_request_employee_leav_requests_path(@employee_leav_request.employee_id)
        end
        @leav_category = LeavCategory.find_by(code: "C.Off")
        if @employee_leav_request.leav_category_id = @leav_category.id
          @leave_c_off = LeaveCOff.where(employee_id: @employee_leav_request.employee_id,taken_date: @employee_leav_request.start_date)
          @leave_c_off.update_all(taken_date: nil)
        end
      end
    else
      flash[:alert] = 'Leave not cancelled. It may be approve or reject.'
      redirect_to hr_view_request_employee_leav_requests_path(@employee_leav_request.employee_id)
    end
  end
  

  def first_approve
    ### if no second reporter available
    if @employee_leav_request.employee.manager_2_id.nil?
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = 'FinalApproved'
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save

          @employee_leav_request.update(is_first_approved: true, current_status: 'FinalApproved')
          @employee_leav_request.create_single_record_for_leave(@employee_leav_request)
          @employee_leav_request.manage_coff(@employee_leav_request)
          @employee_leav_request.create_attendance
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "FinalApproved")
          
          if @employee_leav_request.first_reporter_id == current_user.employee_id
            redirect_to approved_or_rejected_leave_request_manager_self_services_path
             LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
            flash[:notice] = 'Leave Request Approved Successfully.'
          else
            redirect_to all_leave_request_list_employee_leav_requests_path
             LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
            flash[:notice] = 'Leave Request Approved Successfully by Admin.'
          end
        else
          if @employee_leav_request.first_reporter_id == current_user.employee_id
            redirect_to approved_or_rejected_leave_request_manager_self_services_path
            flash[:alert] = 'Leave Already Approved. Please refresh page.'
          else
            redirect_to all_leave_request_list_employee_leav_requests_path
            flash[:alert] = 'Leave Already Approved. Please refresh page.'
          end  
        end# @leave_status.save
      end
    ### if second reporter available
    else
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = params[:id]
        s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
        s.status = 'FirstApproved'
        s.change_date = Time.now
        LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "FirstApproved") 
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_first_approved: true, current_status: 'FirstApproved', second_reporter_id: @employee_leav_request.employee.manager_2_id)
          
          if @employee_leav_request.first_reporter_id == current_user.employee_id

            redirect_to approved_or_rejected_leave_request_manager_self_services_path
             LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
            flash[:notice] = 'Leave Request Approved Successfully.'
          else
            redirect_to all_leave_request_list_employee_leav_requests_path
            LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
            flash[:notice] = 'Leave Request Approved Successfully by Admin.'
          end
        else
          if @employee_leav_request.first_reporter_id == current_user.employee_id
            flash[:alert] = 'Leave Already Approved. Please refresh page.'
            redirect_to approved_or_rejected_leave_request_manager_self_services_path
          else
            flash[:alert] = 'Leave Already Approved. Please refresh page.'
            redirect_to all_leave_request_list_employee_leav_requests_path
          end
        end
      end
    end
  end

  def second_approve
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = 'FinalApproved'
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do
      if @leave_status.save
        @employee_leav_request.update(is_second_approved: true, current_status: 'FinalApproved')
        @employee_leav_request.create_single_record_for_leave(@employee_leav_request)
        @employee_leav_request.manage_coff(@employee_leav_request)
        @employee_leav_request.create_attendance
        LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "FinalApproved")
        
        # LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
        if @employee_leav_request.first_reporter_id == current_user.employee_id
          redirect_to approved_or_rejected_leave_request_manager_self_services_path
          flash[:notice] = 'Leave Request Approved Successfully.'
        else
          redirect_to all_leave_request_list_employee_leav_requests_path
          flash[:notice] = 'Leave Request Approved Successfully by Admin.'
        end
        #LeaveRequestMailer.second_approve(@employee_leav_request).deliver_now
      else
        if @employee_leav_request.first_reporter_id == current_user.employee_id
          flash[:alert] = 'Leave Already Approved. Please refresh page.'
          redirect_to approved_or_rejected_leave_request_manager_self_services_path
        else
          flash[:alert] = 'Leave Already Approved. Please refresh page.'
          redirect_to all_leave_request_list_employee_leav_requests_path
        end
      end
    end
  end

  def first_reject
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = 'Rejected'
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do
      if @leave_status.save
        @employee_leav_request.update(is_first_rejected: true, current_status: 'Rejected')
        LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Rejected") 
        #update in attendance
        @employee_attendance = EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id)
          @latemark_master = LatemarkMaster.last
          @employee_attendance.each do |e|
            if e.employee_week_off_id.present?  
              e.update(employee_leav_request_id: nil,present: "WO",comment: "Leave Cancelled/WeekOff")
            elsif e.holiday_id.present?  
              e.update(employee_leav_request_id: nil,present: "HP",comment: "Leave Cancelled/Holiday")
            elsif e.in_time.present? && e.out_time.present?
              if e.working_hrs < @latemark_master.halfday_working_hrs
                e.update(employee_leav_request_id: nil,present: "HD",comment: "Leave Cancelled/HalfDay")
              else  
                e.update(employee_leav_request_id: nil,present: "P",comment: "Leave Cancelled/Present")
              end #workking_hrs
            else  
            e.update(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled/Absent")
            end 
          end #do

        @employee_leav_request.revert_leave(@employee_leav_request)
      #taken_date:nil
      #EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id).update_all(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled")
        if @employee_leav_request.leav_category_id = @leav_category.id
          @leave_c_off = LeaveCOff.where(employee_id: @employee_leav_request.employee_id,taken_date: @employee_leav_request.start_date)
          @leave_c_off.update_all(taken_date: nil)
        end

         LeaveRequestMailer.first_reject(@employee_leav_request).deliver_now
        if @employee_leav_request.first_reporter_id == current_user.employee_id
          redirect_to approved_or_rejected_leave_request_manager_self_services_path
          flash[:alert] = 'Leave Request Rejected Successfully.'
        else
          redirect_to all_leave_request_list_employee_leav_requests_path
          flash[:alert] = 'Leave Request Rejected Successfully by Admin.'
        end
      else#@leave_status.save
        if @employee_leav_request.first_reporter_id == current_user.employee_id
          flash[:alert] = 'Leave Already Rejected. Please refresh page.'
          redirect_to approved_or_rejected_leave_request_manager_self_services_path
        else
          flash[:alert] = 'Leave Already Rejected. Please refresh page.'
          redirect_to all_leave_request_list_employee_leav_requests_path
        end
      end#@leave_status.save
    end#do
  end

  def second_reject
    @leave_status = LeaveStatusRecord.new do |s|
      s.employee_leav_request_id = params[:id]
      s.change_status_employee_id = current_user.employee_id unless current_user.class == Group
      s.status = 'Rejected'
      s.change_date = Time.now
    end
    ActiveRecord::Base.transaction do
      if @leave_status.save
        @employee_leav_request.update(is_second_rejected: true, current_status: 'Rejected')
        LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Rejected")
        #update in attendance
        @employee_attendance = EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id)
          @latemark_master = LatemarkMaster.last
          @employee_attendance.each do |e|
            if e.employee_week_off_id.present?  
              e.update(employee_leav_request_id: nil,present: "WO",comment: "Leave Cancelled/WeekOff")
            elsif e.holiday_id.present?  
              e.update(employee_leav_request_id: nil,present: "HP",comment: "Leave Cancelled/Holiday")
            elsif e.in_time.present? && e.out_time.present?
              if e.working_hrs < @latemark_master.halfday_working_hrs
                e.update(employee_leav_request_id: nil,present: "HD",comment: "Leave Cancelled/HalfDay")
              else  
                e.update(employee_leav_request_id: nil,present: "P",comment: "Leave Cancelled/Present")
              end #workking_hrs
            else  
            e.update(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled/Absent")
            end 
          end #do

        @employee_leav_request.revert_leave(@employee_leav_request)
        @leav_category = LeavCategory.find_by(code: "C.Off")
        #EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id).update_all(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled")
      #taken_date:nil
        if @employee_leav_request.leav_category_id = @leav_category.id
          @leave_c_off = LeaveCOff.where(employee_id: @employee_leav_request.employee_id,taken_date: @employee_leav_request.start_date)
          @leave_c_off.update_all(taken_date: nil)
        end

         LeaveRequestMailer.second_reject(@employee_leav_request).deliver_now
        if @employee_leav_request.second_reporter_id == current_user.employee_id
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
          flash[:alert] = 'Leave Request Rejected Successfully.'
        else
          redirect_to all_leave_request_list_employee_leav_requests_path
          flash[:alert] = 'Leave Request Rejected Successfully by Admin.'
        end
      else
        if @employee_leav_request.second_reporter_id == current_user.employee_id
          flash[:alert] = 'Leave Already Rejected. Please refresh page.'
          redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        else
          flash[:alert] = 'Leave Already Rejected. Please refresh page.'
          redirect_to all_leave_request_list_employee_leav_requests_path
        end
      end
    end
  end

  def cancel_after_approve
    @particular_leave_record = ParticularLeaveRecord.find(params[:format])
    @employee_leav_request = EmployeeLeavRequest.find_by(id: @particular_leave_record.employee_leav_request_id)
    @current_emp = current_user.employee_id

     @date = @particular_leave_record.leave_date.strftime("%Y-%m-%d")
     LeaveRecord.where("employee_leav_request_id =? AND day =?", @particular_leave_record.employee_leav_request_id, @date).update_all(status: "Cancelled")
    @flag = @particular_leave_record.salary_processed?
    if @flag.nil?
      @particular_leave_record.is_cancel_after_approve = true

      #EmployeeAttendance.where("employee_id = ? AND day = ?", @particular_leave_record.employee_id,@particular_leave_record.leave_date.to_date).destroy_all
      #@employee_leav_balance = EmployeeLeavBalance.where("employee_id = ? AND leav_category_id = ? AND is_active = ?", @particular_leave_record.employee_id, @particular_leave_record.leav_category_id,true).take
     @employee_leav_balance = EmployeeLeavBalance.where(employee_id: @particular_leave_record.employee_id,leav_category_id: @particular_leave_record.leav_category_id,is_active: true).take

      #@employee_leav_request.update(current_status: "Cancelled")

      if @particular_leave_record.try(:leav_category).try(:is_balance) == true
        if @particular_leave_record.is_full == true
          no_of_leave = @employee_leav_balance.no_of_leave.to_f + 1
          @employee_leav_balance.update(no_of_leave: no_of_leave)
        else
          no_of_leave = @employee_leav_balance.no_of_leave.to_f + 0.5
          @employee_leav_balance.update(no_of_leave: no_of_leave)
        end
        @particular_leave_record.update(is_cancel_after_approve: true)
        
      #Attendance Update
        @employee_attendance = EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id,day: @date)
          @latemark_master = LatemarkMaster.last
          @employee_attendance.each do |e|
            if e.employee_week_off_id.present?  
              e.update(employee_leav_request_id: nil,present: "WO",comment: "Leave Cancelled After Approve/WeekOff")
            elsif e.holiday_id.present?  
              e.update(employee_leav_request_id: nil,present: "HP",comment: "Leave Cancelled After Approve/Holiday")
            elsif e.in_time.present? && e.out_time.present?
              if e.working_hrs < @latemark_master.halfday_working_hrs
                e.update(employee_leav_request_id: nil,present: "HD",comment: "Leave Cancelled After Approve/HalfDay")
              else  
                e.update(employee_leav_request_id: nil,present: "P",comment: "Leave Cancelled After Approve/Present")
              end #workking_hrs
            else  
            e.update(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled After Approve/Absent")
            end 
          end #do
          
        ActiveRecord::Base.transaction do
          @employee_leav_balance.save
          if @particular_leave_record.employee_leav_request.leav_category.code == "C.Off"
            #@particular_leave_record.rollback_coff(@particular_leave_record)
            if @particular_leave_record.is_full == true
              @expiry_date = @particular_leave_record.leave_date.to_date + 60
              @leave_c_off = LeaveCOff.create(employee_id: @particular_leave_record.employee_id,c_off_date: @particular_leave_record.leave_date, c_off_type: 'Full Day',
              c_off_expire_day: 60,expiry_status: true,is_taken: false,expiry_date: @expiry_date,leave_count: 1,is_expire: false,current_status: "FinalApproved",taken_date: nil,comment: "Created After Revert")
              #@employee_leav_balance.total_leave = @employee_leav_balance.total_leave.to_f + 1
            else
              @expiry_date = @particular_leave_record.leave_date.to_date + 60
              @leave_c_off = LeaveCOff.create(employee_id: @particular_leave_record.employee_id,c_off_date: @particular_leave_record.leave_date, c_off_type: 'Half Day',
              c_off_expire_day: 60,expiry_status: true,is_taken: false,expiry_date: @expiry_date,leave_count: 0.5,is_expire: false,current_status: "FinalApproved",taken_date: nil,comment: "Created After Revert")
              #@employee_leav_balance.total_leave = @employee_leav_balance.total_leave.to_f + 0.5
            end
            StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @particular_leave_record.employee_id,status: "FinalApproved")
          end
        end#do

        if @employee_leav_request.employee.email.nil? || @employee_leav_request.employee.email == ''
          flash[:notice] = 'Leave Cancelled Successfully without email.'
        else
          flash[:notice] = 'Leave Cancelled Successfully.'
          # LeaveStatusRecordMailer.cancel_after_approve(@particular_leave_record,@current_emp).deliver_now
        end

      else#@particular_leave_record.try(:leav_category).try(:is_balance) == false
        @particular_leave_record.update(is_cancel_after_approve: true)

        #Attendance Update
        @employee_attendance = EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id,day: @date)
          @latemark_master = LatemarkMaster.last
          @employee_attendance.each do |e|
            if e.employee_week_off_id.present?  
              e.update(employee_leav_request_id: nil,present: "WO",comment: "Leave Cancelled After Approve/WeekOff")
            elsif e.holiday_id.present?  
              e.update(employee_leav_request_id: nil,present: "HP",comment: "Leave Cancelled After Approve/Holiday")
            elsif e.in_time.present? && e.out_time.present?
              if e.working_hrs < @latemark_master.halfday_working_hrs
                e.update(employee_leav_request_id: nil,present: "HD",comment: "Leave Cancelled After Approve/HalfDay")
              else  
                e.update(employee_leav_request_id: nil,present: "P",comment: "Leave Cancelled After Approve/Present")
              end #workking_hrs
            else  
            e.update(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled After Approve/Absent")
            end 
          end #do
        #EmployeeAttendance.where(employee_leav_request_id: @employee_leav_request.id,day: @date).update_all(employee_leav_request_id: nil,present: "A",comment: "Leave Cancelled after approve")
          	
        ActiveRecord::Base.transaction do
          @particular_leave_record.save
          if @particular_leave_record.employee_leav_request.leav_category.code == "C.Off"
            #@particular_leave_record.rollback_coff(@particular_leave_record)
            if @particular_leave_record.is_full == true
              @expiry_date = @particular_leave_record.leave_date.to_date + 60
              @leave_c_off = LeaveCOff.create(employee_id: @particular_leave_record.employee_id,c_off_date: @particular_leave_record.leave_date, c_off_type: 'Full Day',
              c_off_expire_day: 60,expiry_status: true,is_taken: false,expiry_date: @expiry_date,leave_count: 1,is_expire: false,current_status: "FinalApproved",taken_date: nil,comment: "Created After Revert")
              #@employee_leav_balance.total_leave = @employee_leav_balance.total_leave.to_f + 1
            else
              @expiry_date = @particular_leave_record.leave_date.to_date + 60
              @leave_c_off = LeaveCOff.create(employee_id: @particular_leave_record.employee_id,c_off_date: @particular_leave_record.leave_date, c_off_type: 'Half Day',
              c_off_expire_day: 60,expiry_status: true,is_taken: false,expiry_date: @expiry_date,leave_count: 0.5,is_expire: false,current_status: "FinalApproved",taken_date: nil,comment: "Created After Revert")
              #@employee_leav_balance.total_leave = @employee_leav_balance.total_leave.to_f + 0.5
            end
              StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @particular_leave_record.employee_id,status: "FinalApproved")
          end
        end#do

        if @employee_leav_request.employee.email.nil? || @employee_leav_request.employee.email == ''
          flash[:notice] = 'Leave Cancelled Successfully without email.'
        else
          flash[:notice] = 'Leave Cancelled Successfully.'
           LeaveStatusRecordMailer.cancel_after_approve(@particular_leave_record,@current_emp).deliver_now
        end
      end #particular_leav_balance.is_payble
    else
      flash[:notice] = 'Salary is processed you cannot cancel the leave.'
    end#@flag.nil?
    redirect_to show_leave_record_particular_leave_records_path(format: @particular_leave_record.employee_leav_request_id)
  end#def

  private

  def set_employee_leav_request
    @employee_leav_request = EmployeeLeavRequest.find(params[:id])
  end
end