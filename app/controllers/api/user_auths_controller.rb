
class Api::UserAuthsController < ApplicationController
  skip_before_action :load_filter
  skip_before_action :authenticate!
  # response.headers['X-Tracking-ID'] = '123456'
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionView::Helpers::DateHelper
  include ApplicationHelper
  # http_basic_authenticate_with :email => "vish.hake04@gmail.com", :password => "12345678"
  # skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def user_sign_in
    if request.format != :json
      render :status=>406, :json=>{:status=>"Failure",:message=>"The request must be json"}
      return
    end
    email = params[:email]
    password = params[:password]
    if email.nil? or password.nil?
      render :status=>400,:json=>{:status=>"Failure",:message=>"The request must contain the email and password."}
      return
    end
    @user = Member.find_by_email(email.downcase) || Member.find_by_manual_member_code(email)
    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:status=>"Failure",:message=>"Invalid email"}
      return
    end
    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:status=>"Failure",:message=>"Invalid password."}
    else
      if @user.is_gps
        @lat = params[:lat].to_f
        @lang = params[:longi].to_f
        @mid = Member.near([@lat, @lang], 10).map(&:id)
        if @mid.present? and @mid.include?(@user.id)
          render :status=>200, :json=>{:status=>"Success"}
        else
          render :status=>401, :json=>{:status=>"Failure", :message=>"You are not in correct location"}
        end
      else
        render :status=>200, :json=>{ :member_id => @user.id,:id => @user.employee_id, :role => @user.role.name, :avatar_file_name => @user.avatar_file_name }
      end
    end
  end

  def employee_list
    @employee = params[:employee_id]
    employees = Employee.where(id: @employee)
    render :json => employees.present? ? employees.collect{|e| {:id => e.id,:passport_photo_file_name => e.passport_photo_file_name,:manual_employee_code => e.manual_employee_code,:first_name => e.first_name,:middle_name => e.middle_name,:last_name => e.last_name,:date_of_birth => e.date_of_birth,:gender => e.gender,:contact_no => e.contact_no,:optinal_contact_no => e.optinal_contact_no,:optinal_contact_no1 => e.optinal_contact_no1,:email => e.email,:optional_email => e.optional_email,:permanent_address => e.permanent_address,:country_id => e.country_id,:state_id => e.state.try(:name),:district_id => e.district.try(:name),:city => e.city,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:licence_no => e.licence_no,:marital_status => e.marital_status,:blood_group_id => e.blood_group.try(:name),:employee_type_id => e.employee_type.try(:name),:nationality_id => e.nationality.try(:name),:religion_id => e.religion.try(:name),:handicap => e.handicap,:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.company.try(:name),:company_location_id => e.company_location.try(:name),:department_id => e.department.try(:name),:sub_department_id => e.sub_department.try(:name), :emergency_contact_no => e.emergency_contact_no, :employee_designation => e.joining_detail.employee_designation.try(:name), :employee_uan_no => e.joining_detail.try(:employee_uan_no) }} : []
  end

  def leave_coff
    @employee = params[:employee_id]
    leave_coff = LeaveCOff.where(taken_date: nil,current_status: "FinalApproved", employee_id: @employee).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
    render :json => leave_coff.present? ? leave_coff.collect{|coff| {:id => coff.id, :employee_id => coff.employee_id, :c_off_date => coff.c_off_date, :c_off_type => coff.c_off_type,:c_off_expire_day => coff.c_off_expire_day,:expiry_status => coff.expiry_status,:is_taken => coff.is_taken,:expiry_date => coff.expiry_date,:leave_count => coff.leave_count,:is_expire => coff.is_expire,:created_at => coff.created_at,:status => coff.status,:current_status => coff.current_status,:taken_date => coff.taken_date, :comment => coff.comment }} : []
  end
    
  def leave_request
    @leave_user = params[:employee_id]
    @employee = Employee.where(id: @leave_user)
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    employee_leav_balances = EmployeeLeavBalance.where(employee_id: @leave_user)
    render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id, :employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count, :leave_count => elb.leave_count,:collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
  end

  def leave_category
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    leav_categories = LeavCategory.where(is_active: true)
    render :json => leav_categories.present? ? leav_categories.collect{|lc| {:id => lc.id, :name => lc.name}} : []
  end

  def check_leave_request
    @leave_user = params[:employee_id]
    @employee = Employee.where(id: @leave_user)
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    employee_leav_balances = EmployeeLeavBalance.where(employee_id: @leave_user)
    render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id,:employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count,:leave_count => elb.leave_count,:collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
  end

  def all_leave_request_list
    @employee_id = params[:employee_id].to_i
    if @employee_id.present?
      leave_list = EmployeeLeavRequest.where(employee_id: @employee_id).order("id DESC")
      render :json => leave_list.present? ? leave_list.collect{|ll| { :id => ll.id, :employee_id => ll.employee_id, :leav_category_initial => ll.leav_category.try(:code), :leav_category_id => ll.leav_category.try(:name), :leave_type => ll.leave_type, :start_date => ll.start_date, :end_date => ll.end_date, :reason=> ll.reason, :current_status=> ll.current_status, :no_of_day => ll.leave_count, :leave_status_records => ll.leave_status_records }} : []
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end

  def leave_approval_list
    employee_id = params[:employee_id].to_i
    if employee_id.present?
      leave_approval  = EmployeeLeavRequest.where(current_status: "Pending", first_reporter_id: employee_id)
      render :json => leave_approval.present? ? leave_approval.collect{|lal| {:manual_employee_code => lal.employee.manual_employee_code, :employee_last_name => lal.employee.last_name, :employee_first_name => lal.employee.first_name, :leave_requests_id => lal.id, :employee_id => lal.employee.id, :current_status => lal.current_status }} : []
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end

  def first_approved_employee_leave_requests
    employee_id = params[:employee_id].to_i
    if employee_id.present?
      leave_approval = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false, second_reporter_id: employee_id)
      render :json => leave_approval.present? ? leave_approval.collect{|lal| {:manual_employee_code => lal.employee.manual_employee_code, :employee_last_name => lal.employee.last_name, :employee_first_name => lal.employee.first_name, :leave_requests_id => lal.id, :employee_id => lal.employee.id, :current_status => lal.current_status }} : []
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end
 
  def cancel_leave_request
    employee_id = params[:employee_id].to_i
    leave_req_id = params[:leave_req_id].to_i
    @employee_leav_request = EmployeeLeavRequest.find(leave_req_id)
    
    if @employee_leav_request.current_status == 'Pending'
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = leave_req_id
        s.change_status_employee_id = @employee_leav_request.employee_id
        s.status = 'Cancelled'
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_cancelled: true, current_status: 'Cancelled')
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Cancelled")
          @employee_leav_request.revert_leave(@employee_leav_request)
          LeaveRequestMailer.cancel(@employee_leav_request).deliver_now
          render :status=>200, :json=>{:status=>"Leave Cancelled Successfully"}
        else
          render :status=>200, :json=>{:status=>"Leave Already cancelled. Please refresh page."}
        end
        @leav_category = LeavCategory.find_by(code: "C.Off")
        if @employee_leav_request.leav_category_id = @leav_category.id
          @leave_c_off = LeaveCOff.where(employee_id: @employee_leav_request.employee_id,taken_date: @employee_leav_request.start_date)
          @leave_c_off.update_all(taken_date: nil)
        end
      end
    else
      render :status=>200, :json=>{:status=>"Leave not cancelled. It may be approve or reject."}
    end
    # render :status=>200, :json=>{:status=>"Success"}
  end

  def approve_leave_request
    employee_id = params[:employee_id].to_i
    current_user = Employee.find(employee_id)
    employee_leav_request = params[:leave_req_id].to_i
    @employee_leav_request = EmployeeLeavRequest.find(employee_leav_request)
    ## if no second reporter available
    if @employee_leav_request.current_status == "Pending"
      if @employee_leav_request.employee.manager_2_id.nil?
        @leave_status = LeaveStatusRecord.new do |s|
          s.employee_leav_request_id = employee_leav_request
          s.change_status_employee_id = employee_id unless Member.find(employee_id).class == Group
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
            if @employee_leav_request.first_reporter_id == employee_id
              # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
              LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully."}
            else
              # redirect_to all_leave_request_list_employee_leav_requests_path
              LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully by Admin.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully by Admin."}
            end
          else
            if @employee_leav_request.first_reporter_id == employee_id
              # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
              # flash[:alert] = 'Leave Already Approved. Please refresh page.'
              render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
            else
              # redirect_to all_leave_request_list_employee_leav_requests_path
              # flash[:alert] = 'Leave Already Approved. Please refresh page.'
              render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
            end  
          end# @leave_status.save
        end
      ### if second reporter available
      else
        @leave_status = LeaveStatusRecord.new do |s|
          s.employee_leav_request_id = employee_leav_request
          s.change_status_employee_id = employee_id unless Member.find(employee_id).class == Group
          s.status = 'FirstApproved'
          s.change_date = Time.now
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "FirstApproved")
        end
        ActiveRecord::Base.transaction do
          if @leave_status.save
            @employee_leav_request.update(is_first_approved: true, current_status: 'FirstApproved', second_reporter_id: @employee_leav_request.employee.manager_2_id)
            if @employee_leav_request.first_reporter_id == employee_id
              # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
              LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully."}
            else
              # redirect_to all_leave_request_list_employee_leav_requests_path
              LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully by Admin.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully by Admin."}
            end
          else
            if @employee_leav_request.first_reporter_id == employee_id
              # flash[:alert] = 'Leave Already Approved. Please refresh page.'
              render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
              # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
            else
              # flash[:alert] = 'Leave Already Approved. Please refresh page.'
              render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
              # redirect_to all_leave_request_list_employee_leav_requests_path
            end
          end
        end
      end
    else
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = employee_leav_request
        s.change_status_employee_id = employee_id unless Member.find(employee_id).class == Group
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
        #LeaveRequestMailer.second_approve(@employee_leav_request).deliver_now
        LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
        if @employee_leav_request.second_reporter_id == employee_id
          # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
          # flash[:notice] = 'Leave Request Approved Successfully.'
          render :status=>200, :json=>{:status=>"Leave Request Approved Successfully."}
        else
          # redirect_to all_leave_request_list_employee_leav_requests_path
          # flash[:notice] = 'Leave Request Approved Successfully by Admin.'
          render :status=>200, :json=>{:status=>"Leave Request Approved Successfully by Admin."}
        end
      else
        if @employee_leav_request.second_reporter_id == employee_id
          # flash[:alert] = 'Leave Already Approved. Please refresh page.'
          render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
          # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
        else
          # flash[:alert] = 'Leave Already Approved. Please refresh page.'
          render :status=>200, :json=>{:status=>"Leave Already Approved. Please refresh page."}
          # redirect_to all_leave_request_list_employee_leav_requests_path
        end
       end
      end
    end
  end

  def reject_leave_request
    employee_id = params[:employee_id].to_i
    current_user = Employee.find(employee_id)
    employee_leav_request = params[:leave_req_id].to_i
    @employee_leav_request = EmployeeLeavRequest.find(employee_leav_request)
    if @employee_leav_request.current_status = "Pending"
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = employee_leav_request
        s.change_status_employee_id = employee_id unless current_user.class == Group
        s.status = 'Rejected'
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_first_rejected: true, current_status: 'Rejected')
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Rejected")   
          @employee_leav_request.revert_leave(@employee_leav_request)
          LeaveRequestMailer.first_reject(@employee_leav_request).deliver_now
          if @employee_leav_request.first_reporter_id == employee_id
            # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
            render :status=>200, :json=>{:status=>"Leave Request Rejected Successfully."}
            # flash[:alert] = 'Leave Request Rejected Successfully.'
          else
            # redirect_to all_leave_request_list_employee_leav_requests_path
            # flash[:alert] = 'Leave Request Rejected Successfully by Admin.'
            render :status=>200, :json=>{:status=>"Leave Request Rejected Successfully by Admin."}
          end
        else
          if @employee_leav_request.first_reporter_id == employee_id
            # flash[:alert] = 'Leave Already Rejected. Please refresh page.'
            render :status=>200, :json=>{:status=>"Leave Already Rejected. Please refresh page."}
            # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
          else
            # flash[:alert] = 'Leave Already Rejected. Please refresh page.'
            render :status=>200, :json=>{:status=>"Leave Already Rejected. Please refresh page."}
            # redirect_to all_leave_request_list_employee_leav_requests_path
          end
        end
      end
    else
      @leave_status = LeaveStatusRecord.new do |s|
        s.employee_leav_request_id = employee_leav_request
        s.change_status_employee_id = employee_id unless current_user.class == Group
        s.status = 'Rejected'
        s.change_date = Time.now
      end
      ActiveRecord::Base.transaction do
        if @leave_status.save
          @employee_leav_request.update(is_second_rejected: true, current_status: 'Rejected')
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "Rejected")
          @employee_leav_request.revert_leave(@employee_leav_request)
          LeaveRequestMailer.second_reject(@employee_leav_request).deliver_now
          if @employee_leav_request.second_reporter_id == employee_id
            # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
            # flash[:alert] = 'Leave Request Rejected Successfully.'
            render :status=>200, :json=>{:status=>"Leave Request Rejected Successfully."}
          else
            # redirect_to all_leave_request_list_employee_leav_requests_path
            # flash[:alert] = 'Leave Request Rejected Successfully by Admin.'
            render :status=>200, :json=>{:status=>"Leave Request Rejected Successfully by Admin."}
          end
        else
          if @employee_leav_request.second_reporter_id == employee_id
            # flash[:alert] = 'Leave Already Rejected. Please refresh page.'
            render :status=>200, :json=>{:status=>"Leave Already Rejected. Please refresh page."}
            # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
          else
            # flash[:alert] = 'Leave Already Rejected. Please refresh page.'
            render :status=>200, :json=>{:status=>"Leave Already Rejected. Please refresh page."}
            # redirect_to all_leave_request_list_employee_leav_requests_path
          end
        end
      end
    end
  end
 
  def employee_leave_request
    status  = ''
    @employee = params[:employee_id].to_i
    @leave_category = params[:leave_catagory].to_i
    leave_category = LeavCategory.find_by(code: "C.Off")
    @leave_type = params[:leave_type]
    @first_half = params[:first_half]
    @last_half = params[:last_half]
    @half_day_present = params[:half_day_present]
    start_date = params[:from_date]
    end_date = params[:to_date]
    @c_off_date = params[:c_off_date]
    @reason = params[:reason]
    first_reporter_id = params[:manager1_id].to_i
    second_reporter_id = params[:manager2_id].to_i
    payroll_period = PayrollPeriod.where(status: true).take
    @employee_leav_request = EmployeeLeavRequest.new(employee_id: @employee, leav_category_id: @leave_category, leave_type: @leave_type, first_half: @first_half, last_half: @last_half, start_date: start_date, end_date: end_date, reason: @reason, first_reporter_id: first_reporter_id, second_reporter_id: second_reporter_id )
    @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee, @leave_category ,true).take

    if @leave_category == leave_category.id
      end_date = params[:to_date]
      @leave_c_off_id = params[:c_off_date]
      if end_date == "" || @leave_c_off_id == "" || @leave_c_off_id == nil
        # flash[:alert] = "Please Fill mendatory Fields"
        # render :status=>200, :json=>{:status=>"Please Fill mendatory Fields"}
        status = "Please Fill mendatory Fields"
      else#end_date == nil
        if start_date.to_date >= payroll_period.from.to_date && start_date.to_date <= payroll_period.to.to_date
          @leave_c_off_id = params[:c_off_date]
          @leave_c_off = LeaveCOff.find_by(id: @leave_c_off_id)
          if start_date.to_date > @leave_c_off.c_off_date.to_date
            if @leave_c_off.expiry_date < start_date.to_date
              # flash[:alert] = "Compensatory off expired for this day"
              # render :status=>200, :json=>{:status=>"Compensatory off expired for this day"}
              status = "Compensatory off expired for this day"
            elsif @leave_c_off.c_off_date > start_date.to_date
              # flash[:alert] = "Please check Compensatory off day"
              # render :status=>200, :json=>{:status=>"Please check Compensatory off day"}
              status = "Please check Compensatory off day"
            elsif @employee_leav_request.is_available_coff?
              # flash[:alert] = "Your Leave Request already has been sent"
              # render :status=>200, :json=>{:status=>"Your Leave Request already has been sent"}
              status = "Your Leave Request already has been sent"
            elsif @employee_leav_request.is_salary_processed_coff?
              # flash[:alert] = "Salary Processed for this month"
              # render :status=>200, :json=>{:status=>"Salary Processed for this month"}
              status = "Salary Processed for this month"
            elsif Employee.find_by_id(@employee).manager_id.nil?
              # flash[:alert] = 'Reporting manager not set please set Reporting Manager'
              # render :status=>200, :json=>{:status=>"Reporting manager not set please set Reporting Manager"}
              status = "Reporting manager not set please set Reporting Manager"
            else
              @employee_leav_request.first_reporter_id = Employee.find(@employee).manager_id
              @employee_leav_request.is_pending = true
              @employee_leav_request.current_status = 'Pending'
              @employee_leav_request.leave_count = 1
              @employee_leav_request.leave_type = "Full Day"
              @employee_leav_request.is_cancelled = false
              @employee_leav_request.is_first_approved = false
              @employee_leav_request.is_first_rejected = false
              @employee_leav_request.is_second_approved = false
              @employee_leav_request.is_second_rejected = false
              end_date = start_date
              @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee, @employee_leav_request.params[:leave_category],true).take
              LeaveCOff.find_by(id: @leave_c_off_id).update(taken_date: start_date)
              @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id,status: "Pending", change_date: Date.today)
              @employee_leav_request.save
              @employee_leav_request.leave_record_create_coff(@employee_leav_request)
              unless @emp_leave_bal.nil?
                no_of_leave = @emp_leave_bal.no_of_leave.to_f - @employee_leav_request.leave_count.to_f
                @emp_leave_bal.update(no_of_leave: no_of_leave)
                @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
              end
                # flash[:notice] = "Created successfully!"
              # render :status=>200, :json=>{:status=>"Created successfully!"}
              status = "Created successfully!"
              LeaveRequestMailer.pending(@employee_leav_request).deliver_now
            end
          else
            # flash[:alert] = "C.Off Not Available For #{@form_date}"
            # render :status=>200, :json=>{:status=>"C.Off Not Available For #{@form_date}"}
            status = "C.Off Not Available For #{@form_date}"
          end#c_off_date
        else
          # flash[:alert] = "Please Select Date Within Payroll Period"
          # render :status=>200, :json=>{:status=>"Please Select Date Within Payroll Period"}
          status = "Please Select Date Within Payroll Period"
        end
      end#end_date == nil
      if current_user.params[:employee_id] == @employee_leav_request.params[:employee_id]
        # redirect_to employee_leav_requests_path
      else
        # redirect_to hr_view_request_employee_leav_requests_path(@employee)
      end
    else#c_off
      @emp_leav_req = EmployeeLeavRequest.where(employee_id: @employee, start_date: start_date, end_date: end_date)
      if params[:flag] == "Full/Half"
        @employee_leav_request.last_half = params[:last_half]
        @employee_leav_request.first_half = params[:first_half]
        @employee_leav_request.present_status = params[:common][:present_status]
        @checkbox = true
      else
        @checkbox = false
      end
      payroll_period = PayrollPeriod.where(status: true).take
      @leav_category = LeavCategory.find_by(id: @leave_category)
      if payroll_period.nil?
        # flash[:alert] = "Payroll Period Not set!"
        # render :status=>200, :json=>{:status=>"Payroll Period Not set!"}
        status = "Payroll Period Not set!"
        # redirect_to hr_view_request_employee_leav_requests_path(@employee)
      else
        if start_date == "" || end_date == ""
          # flash[:alert] = "Please fill all mandatory fields "
          # render :status=>200, :json=>{:status=>"Please fill all mandatory fields "}
          status = "Please fill all mandatory fields"
          # redirect_to hr_view_request_employee_leav_requests_path(@employee)
        else
          if start_date.to_date >= payroll_period.from.to_date && end_date.to_date <= payroll_period.to.to_date
            if @employee_leav_request.end_date == nil
              # flash[:alert] = "please Fill all mendatory fields"
              # render :status=>200, :json=>{:status=>"please Fill all mendatory fields"}
              status = "please Fill all mendatory fields"
              # redirect_to new_employee_leav_request_path
            elsif @employee_leav_request.is_available?
              # flash[:alert] = "Your Leave Request already has been sent status is Pending"
              # render :status=>200, :json=>{:status=>"Your Leave Request already has been sent status is Pending"}
              status = "Your Leave Request already has been sent status is Pending"
              # redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_first_approved?
              #flash[:alert] = "Your Leave Request already has been sent status is First Approved"
              # render :status=>200, :json=>{:status=>"Your Leave Request already has been sent status is First Approved"}
              status = "Your Leave Request already has been sent status is First Approved"
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_final_approved?
              # flash[:alert] = "Request already has Approved"
              # render :status=>200, :json=>{:status=>"Request already has Approved"}
              status = "Request already has Approved"
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_salary_processed?
              # flash[:alert] = "Attendance Confirm Please Contact to Admin"
              # render :status=>200, :json=>{:status=>"Attendance Confirm Please Contact to Admin"}
              status = "Attendance Confirm Please Contact to Admin"
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_continue?
            #   flash[:alert] = "Leave Can't take continueously"
                # render :status=>200, :json=>{:status=>"Leave Can't take continueously"}
                status = "Leave Can't take continueously"
            #   redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif Employee.find(@employee).nil?
              # flash[:alert] = 'Reporting manager not set please set Reporting Manager'
                # render :status=>200, :json=>{:status=>"Reporting manager not set please set Reporting Manager"}
                status = "Reporting manager not set please set Reporting Manager"
              # redirect_to root_url
            else
              # @employee_leav_request.first_reporter_id = @employee.manager_id
              @employee_leav_request.is_pending = true
              @employee_leav_request.current_status = 'Pending'
              if @employee_leav_request.leave_type == 'Full Day'
                @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
              elsif @employee_leav_request.leave_type == 'Full/Half'
                if @employee_leav_request.first_half == true && @employee_leav_request.last_half == true
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f
                elsif @employee_leav_request.first_half == true
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                elsif @employee_leav_request.last_half == true
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                else
                  @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
                end
              elsif @employee_leav_request.leave_type == 'Half Day'
                @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
              elsif @employee_leav_request.leave_type == ''
                @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
              else
                @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
              end
                @employee_leav_request.is_cancelled = false
                @employee_leav_request.is_first_approved = false
                @employee_leav_request.is_first_rejected = false
                @employee_leav_request.is_second_approved = false
                @employee_leav_request.is_second_rejected = false
                @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee, @leave_category, true).take
                type = LeavCategory.find(@employee_leav_request.leav_category_id).is_payble
              #leave_limit
                @leav_category = LeavCategory.find_by(id: @employee_leav_request.leav_category_id)
                monthly_count = @employee_leav_request.leave_monthly_limit(@employee_leav_request)
                # if @leav_category.monthly_leave != nil && monthly_count > @leav_category.monthly_leave.to_f
                #   # flash[:alert] = "Leave Monthly Limit Extended !"
                #   render :status=>200, :json=>{:status=>"Leave Monthly Limit Extended !"}
                #   # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)

                if type == false
                  @employee_leav_request.save
                  @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee, status: "Pending", change_date: Date.today)
                  @employee_leav_request.save
                  # render :status=>200, :json=>{:status=>"Send request is Pending..!"}
                  status = "Send request is Pending..!"
                #leave_record
                  @employee_leav_request.leave_record_create(@employee_leav_request)
                  @employee_leav_request.create_attendance_leave
                  @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                    total = 0
                    @leave_record.each do |l|
                      total = total + l.count
                    end
                  total
                  @employee_leav_request.update(leave_count: total)
                  @employee_leav_request.minus_leave(@employee_leav_request)
                  # if @employee.manager_id.email.nil? or @employee.manager_id.email == ""
                  #   # flash[:notice] = "Send request without email."
                  #   render :status=>200, :json=>{:status=>"Send request without email."}
                  # else
                  #   # flash[:notice] = 'Leave Request sent successfully.'
                  #   render :status=>200, :json=>{:status=>"Leave Request sent successfully."}
                  #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  # end
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                elsif @leav_category.is_limit == true && @employee_leav_request.is_out_of_limit(@employee_leav_request)
                  # f# redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                elsif @leav_category.is_limit == true && @employee_leav_request.is_out_of_limit(@employee_leav_request)
                  # flash[:alert] = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"
                  # render :status=>200, :json=>{:status=>"Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"}
                  status = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)lash[:alert] = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"
                  # render :status=>200, :json=>{:status=>"Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"}
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              else
                @leave_category = LeavCategory.where(id: @employee_leav_request.leav_category_id, is_active: true).take
                if @leave_category.is_balance == true
                  if @emp_leave_bal.nil?
                    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee)
                    # flash.now[:alert] = 'Leave balance not set- contact to admin.'
                    # render :status=>200, :json=>{:status=>"Leave balance not set- contact to admin."}
                    status ="Leave balance not set- contact to admin."
                    # render :new
                  elsif @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
                    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee)
                    # flash.now[:alert] = 'Not Allowed. You exceed the leave limit.'
                    # render :status=>200, :json=>{:status=>"Not Allowed. You exceed the leave limit."}
                    status = "Not Allowed. You exceed the leave limit."
                    # render :new
                  elsif @employee_leav_request.try(:start_date).try(:to_date) < @emp_leave_bal.try(:from_date).try(:to_date)
                    
                    @emp_leave_bal1 =  EmployeeLeavBalance.where(employee_id: @employee, leav_category_id: @employee_leav_request.leav_category_id,is_active: false).last
                    if @employee_leav_request.leave_count.to_f > @emp_leave_bal1.try(:no_of_leave).to_f
                      # flash[:alert] = 'You Have No Balance For This Date'
                      # render :status=>200, :json=>{:status=>"You Have No Balance For This Date"}
                      status = "You Have No Balance For This Date"
                    else
                      @employee_leav_request.leave_status_records.build(change_status_employee_id: current_user.employee_id, status: 'Pending', change_date: Date.today)
                      @employee_leav_request.save
                    #emp_leav_bal_id
                      @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                      @employee_leav_request.leave_record_create(@employee_leav_request)
                      @employee_leav_request.create_attendance_leave
                    # @leave_record = LeaveRecord.last
                      @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                      total = 0
                      @leave_record.each do |l|
                        total = total + l.count
                      end
                      total
                      @employee_leav_request.update(leave_count: total)
                      @employee_leav_request.minus_leave(@employee_leav_request)
                      # if @employee.manager_id.email.nil? || @employee.manager_id.email == ''
                      #   # flash[:notice] = 'Send request without email.'
                      #   render :status=>200, :json=>{:status=>"Send request without email."}
                      # else
                      #   # flash[:notice] = 'Leave Request sent successfully..'
                      #   render :status=>200, :json=>{:status=>"Leave Request sent successfully.."}
                      #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                      # end
                    end
                      # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                  elsif @leav_category.from.nil? or @leav_category.to.nil?
                    @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee, status: 'Pending', change_date: Date.today)
                    if @employee_leav_request.save
                      @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                      @employee_leav_request.leave_record_create(@employee_leav_request)
                      @employee_leav_request.create_attendance_leave
                      @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                      total = 0
                      @leave_record.each do |l|
                        total = total.to_f + l.count.to_f
                      end
                    total.to_f
                    @employee_leav_request.update(leave_count: total)
                    @employee_leav_request.minus_leave(@employee_leav_request)
                    # if @employee.manager_id.email.nil? || @employee.manager_id.email == ''
                    #   # flash[:notice] = 'Send request without email.'
                    #   render :status=>200, :json=>{:status=>"Send request without email."}
                    # else
                    #   # flash[:notice] = 'Leave Request sent successfully..'
                    #   render :status=>200, :json=>{:status=>"Leave Request sent successfully.."}
                    #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                    # end
                    # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                  else
                    # render :new
                  end
                elsif type == 'C.Off'
                  @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee, status: 'Pending', change_date: Date.today)
                  if @employee_leav_request.save
                    #emp_leav_bal_id
                    @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                    #leave_record
                    @employee_leav_request.leave_record_create(@employee_leav_request)
                    @employee_leav_request.create_attendance_leave
                    # @leave_record = LeaveRecord.last
                    @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                    total = 0
                    @leave_record.each do |l|
                      total = total + l.count
                    end
                    total
                    @employee_leav_request.update(leave_count: total)
                    #@employee_leav_request.manage_coff(@employee_leav_request)
                    @employee_leav_request.minus_leave(@employee_leav_request)
                    # if @employee.manager_id.email.nil? || @employee.manager_id.email == ''
                    #   # flash[:notice] = 'Send request without email.'
                    #   render :status=>200, :json=>{:status=>"Send request without email."}
                    # else
                    #   # flash[:notice] = 'Leave Request sent successfully !!'
                    #   render :status=>200, :json=>{:status=>"Leave Request sent successfully !!"}
                    #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                    # end
                    # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                  else
                    # render :new
                  end
                else
                  @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee, status: 'Pending', change_date: Date.today)
                  if @employee_leav_request.save
                    #emp_leav_bal_id
                    @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                    #leave_record
                    @employee_leav_request.leave_record_create(@employee_leav_request)
                    @employee_leav_request.create_attendance_leave
                    # @leave_record = LeaveRecord.last
                    @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                    total = 0
                    @leave_record.each do |l|
                      total = total + l.count
                    end
                    total
                    @employee_leav_request.update(leave_count: total)

                    @employee_leav_request.minus_leave(@employee_leav_request)
                    # if @employee.manager_id.email.nil? || @employee.manager_id.email == ''
                    #   # flash[:notice] = 'Send request without email.'
                    #   render :status=>200, :json=>{:status=>"Send request without email."}
                    # else
                    #   # flash[:notice] = 'Leave Request sent successfully !'
                    #   render :status=>200, :json=>{:status=>"Leave Request sent successfully !"}
                    #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                    # end
                    # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                  else
                    # render :new
                  end
                end#balance.nil?
              else #is_balance == true
                @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee, status: 'Pending', change_date: Date.today)
                if @employee_leav_request.save
                  #leave_record
                  @employee_leav_request.leave_record_create(@employee_leav_request)
                  @employee_leav_request.create_attendance_leave
                  # @leave_record = LeaveRecord.last
                  @leave_record = LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id)
                  total = 0
                  @leave_record.each do |l|
                    total = total + l.count
                  end
                  total
                  @employee_leav_request.update(leave_count: total)

                  @employee_leav_request.minus_leave(@employee_leav_request)
                  # if @employee.manager_id.email.nil? || @employee.manager_id.email == ''
                  #   # flash[:notice] = 'Send request without email.'
                  #   render :status=>200, :json=>{:status=>"Send request without email."}
                  # else
                  #   # flash[:notice] = 'Leave Request sent successfully !'
                  #   render :status=>200, :json=>{:status=>"Leave Request sent successfully..!"}
                  #   LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  # end
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
                else
                  # render :new
                end
              end #@leave_category.is_balance == true
            end #monthly_count > @leav_category.monthly_leave.to_f
          end #@employee_leav_request.end_date == nil

          if @employee_leav_request.id != nil
            if @employee_leav_request.leave_type == 'Full/Half'
              if @employee_leav_request.first_half == false && @employee_leav_request.last_half == false
                @employee_leav_request.update(first_half: false,last_half: true)
              end
            end

            if @employee_leav_request.leave_type == 'Half Day'
              if @employee_leav_request.first_half == true && @employee_leav_request.last_half == true
                @employee_leav_request.update(first_half: true,last_half: false)
              elsif @employee_leav_request.first_half == false && @employee_leav_request.last_half == false
                @employee_leav_request.update(first_half: true,last_half: false)
              else @employee_leav_request.first_half == true || @employee_leav_request.last_half == true
                @employee_leav_request.save
              end
            end
          else
          end
          else #start_date == payroll_period.from.to_date
            if @employee_id == @employee_leav_request.employee_id
              # flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
              # render :status=>200, :json=>{:status=>"Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"}
              # redirect_to employee_leav_requests_path
            else
              # flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
              # render :status=>200, :json=>{:status=>"Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"}
              # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              #redirect_to employee_list_on_duty_requests_path
            end  
          end
        end#start_date == nil
      end#if payroll_period.nil?
    end#c_off
    if status.empty?
      render :status=>200, :json=>{:status=> "Success"}
    else
      render :status=>200, :json=>{:status=> status}
    end
  end

  def employee_plan
    employee_id = params[:employee_id].to_i
    from_date = params[:from_date]
    to_date = params[:to_date]
    from_time = params[:from_time]
    to_time = params[:to_time]
    meeting_with = params[:meeting_with]
    location = params[:location]
    meeting_agenda = params[:meeting_agenda]
    latitude = params[:latitude]
    longitude = params[:longitude]
    conform = params[:conform]
    status = params[:status]
    current_status = params[:current_status]
    manager_id = params[:manager_id].to_i
    @employee_plan = EmployeePlan.where(employee_id: employee_id)
    if @employee_plan.present?
      employee_plan = @employee_plan.where(from_date: from_date.to_date, to_date: to_date.to_date)
      if employee_plan.present?
        if from_plan = employee_plan.where("? BETWEEN from_time AND to_time", from_time).present?
          render :status=>200, :json=>{:status=>"Sorry..!! This Time was already reserved..."}  
        elsif to_plan = employee_plan.where("? BETWEEN from_time AND to_time", to_time).present?
          render :status=>200, :json=>{:status=>"Sorry..!! This Time was already reserved..."}
        else
          employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
          if employee_plan.save
            render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
          else
            render :status=>200, :json=>{:status=>"Employee is not Found."}
          end
        end
      else
        employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
        if employee_plan.save
          render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
        else
          render :status=>200, :json=>{:status=>"Employee is not Found."}
        end
      end    
    else
      employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
      if employee_plan.save
        render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
      else
        render :status=>200, :json=>{:status=>"Employee is not Found."}
      end
    end
  end

  def particular_employee_plan_list
    employee_id = params[:employee_id]
    date = params[:date]
    employee_plan = EmployeePlan.where(employee_id: employee_id)
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :conform => epl.conform, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master => epl.plan_reason_master_id, :feedback => epl.feedback  }} : []
  end

  def employee_plan_list
    manager_id = params[:manager_id]
    employee_id = params[:employee_id]
    date = params[:date]
    status = params[:status]
    if manager_id.empty?
      if status == "all"
        employee_plan = EmployeePlan.where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('employee_id = ? AND plan_reason_master_id IS ?', employee_id, nil).where("? BETWEEN from_date AND from_date", date)
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ? AND feedback IS ?', nil , nil).where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      elsif status.present? || status != "all" || status != "Attend" || status != "Not Attend"
        employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: status ).where("? BETWEEN from_date AND from_date", date)
      else
        employee_plan = EmployeePlan.where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      end
    elsif manager_id.present? || employee_id.present?
      if status == "all"
        employee_plan = EmployeePlan.where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('employee_id = ? AND plan_reason_master_id IS ?', employee_id, nil).where("? BETWEEN from_date AND from_date", date)
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ? AND feedback IS ?', nil , nil).where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      elsif status.present? || status != "all" || status != "Attend" || status != "Not Attend"
        employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: status ).where("? BETWEEN from_date AND from_date", date)
      else
        employee_plan = EmployeePlan.where(employee_id: employee_id).where("? BETWEEN from_date AND from_date", date)
      end
    else manager_id.present? || employee_id.empty?
      if status == "all"
        employee_plan = EmployeePlan.where("? BETWEEN from_date AND from_date", date).where(manager_id: manager_id)
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('plan_reason_master_id IS ?', nil).where("? BETWEEN from_date AND from_date", date).where(manager_id: manager_id)
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ? AND feedback IS ?', nil , nil).where("? BETWEEN from_date AND from_date", date).where(manager_id: manager_id)
      elsif status.present? || status != "all" || status != "Attend" || status != "Not Attend"
        employee_plan = EmployeePlan.where(current_status: status ).where("? BETWEEN from_date AND from_date", date).where(manager_id: manager_id)
      else
        employee_plan = EmployeePlan.where("? BETWEEN from_date AND from_date", date).where(manager_id: manager_id)
      end
    end
    if employee_plan.present?
      render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :conform => epl.conform, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master_id => epl.plan_reason_master.try(:name), :feedback => epl.feedback  }} : []
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end

  def update_employee_plan
    employee_id = params[:employee_id].to_i
    from_date = params[:from_date]
    to_date = params[:to_date]
    from_time = params[:from_time]
    to_time = params[:to_time]
    meeting_with = params[:meeting_with]
    location = params[:location]
    meeting_agenda = params[:meeting_agenda]
    latitude = params[:latitude]
    longitude = params[:longitude]
    conform = params[:conform]
    status = params[:status]
    current_status = params[:current_status]
    manager_id = params[:manager].to_i
    plan_id = params[:plan_id].to_i
    # @update_employee_plan = EmployeePlan.find(plan_id)
    @employee_plan = EmployeePlan.where(employee_id: employee_id)
    if @employee_plan.present?
      employee_plan = @employee_plan.where(from_date: from_date.to_date, to_date: to_date.to_date)
      if employee_plan.present?
        if from_plan = employee_plan.where("? BETWEEN from_time AND to_time", from_time).present?
          render :status=>200, :json=>{:status=>"Sorry..!! This From Time was already reserved..."}  
        elsif to_plan = employee_plan.where("? BETWEEN from_time AND to_time", to_time).present?
          render :status=>200, :json=>{:status=>"Sorry..!! This To Time was already reserved..."}
        else
          @update_employee_plan = EmployeePlan.find(plan_id)
          updated_plan = @update_employee_plan.update(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
          render :status=>200, :json=>{:status=>"Employee plan was successfully updated."}
        end
      else
        @update_employee_plan = EmployeePlan.find(plan_id)
        updated_plan = @update_employee_plan.update(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
        render :status=>200, :json=>{:status=>"Employee plan was successfully updated."}
      end    
    else
      render :status=>200, :json=>{:status=>"Employee Plan is not Found."}
    end
  end

  def meeting_plan_approve
    conform = params[:conform]
    status = params[:status]
    current_status = params[:current_status]
    plan_id = params[:plan_id]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: current_status, status: status, conform: conform)
    render :status=>200, :json=>{:status=>"Employee plan Approved successfully."}  
  end

  def cancel_employee_plan
    plan_id = params[:plan_id]
    @employee_plan = EmployeePlan.find(plan_id)
    @employee_plan.update(current_status: "Cancelled", status: "false")
    render :status=>200, :json=>{:status=>"Employee plan was successfully Cancelled."}
  end

  def holiday_setup
    employee_id = params[:employee_id].to_i
    @day = params[:day]
    employee_attendances = EmployeeAttendance.where(present: 'H', employee_id: employee_id)
    render :json => employee_attendances.present? ? employee_attendances.collect{|eat| {:id => eat.id, :employee_id => eat.employee_id, :day => eat.day, :present => eat.present, :in_time => eat.in_time, :out_time => eat.out_time, :machine_attendance_id => eat.machine_attendance_id, :is_confirm => eat.is_confirm, :department_id => eat.department_id, :count => eat.count, :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :company_time_master_id => eat.company_time_master_id, :working_hrs => eat.working_hrs, :rest_time => eat.rest_time, :holiday_id => eat.holiday.name }} : []
  end

  def employee_contact_library
    employees = Employee.where(status: "Active")
    render :json => employees.present? ? employees.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no }} : []
  end
 
  def employee_details
    employee_id = params[:employee_id]
    employee = Employee.where(id: employee_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.name, :employee_designation => emp.joining_detail.employee_designation.name  }} : []
  end

  def approve_plan_list
    employee_id = params[:employee_id].to_i
    employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: employee_id)
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id, :prefix => epl.employee.prefix, :employee_first_name => epl.employee.first_name, :employee_middle_name => epl.employee.middle_name, :employee_last_name => epl.employee.last_name, :from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :conform => epl.conform, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id  }} : []
  end
 
  def manager_approve_plan_list
    employee_id = params[:employee_id].to_i
    employee_plan = EmployeePlan.where(current_status: "Approved", manager_id: employee_id)
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id, :prefix => epl.employee.prefix, :employee_first_name => epl.employee.first_name, :employee_middle_name => epl.employee.middle_name, :employee_last_name => epl.employee.last_name, :from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :conform => epl.conform, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id  }} : []
  end

  def manager1_employee_list
    manager_id = params[:employee_id]
    employee = Employee.where('manager_id = ?', manager_id)
    # @employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: manager_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :first_name => emp.first_name, :middle_name => emp.middle_name, :last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.name, :employee_designation => emp.joining_detail.employee_designation.name  }} : []
  end

  def manager2_employee_list
    manager_id = params[:employee_id]
    employee = Employee.where('manager_2_id = ?', manager_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :first_name => emp.first_name, :middle_name => emp.middle_name, :last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.name, :employee_designation => emp.joining_detail.employee_designation.name  }} : []
  end

  def contact_details
    contact_details = ContactDetail.where(status: true)
    render :json => contact_details.present? ? contact_details.collect{|cd| {:id => cd.id, :employee_id => cd.employee_id, :passport_photo_file_name => cd.employee.try(:passport_photo_file_name), :prefix => cd.employee.try(:prefix), :employee_first_name => cd.employee.try(:first_name), :employee_middle_name => cd.employee.try(:middle_name), :employee_last_name => cd.employee.try(:last_name), :contact_no => cd.employee.try(:contact_no), :email => cd.employee.try(:email), :current_role => cd.employee.try(:joining_detail).try(:employee_designation).try(:name), :description => cd.description, :status => cd.status, :role1 => cd.role1, :role2 => cd.role2, :role3 => cd.role3, :role4 => cd.role4, :role5 => cd.role5, :role6 => cd.role6, :role6 => cd.role6, :role7 => cd.role7,:role8 => cd.role8  }} : []
  end
 
  def all_employee_list
    emp_name = Employee.all
    render :json => emp_name.present? ? emp_name.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :first_name => emp.first_name, :middle_name => emp.middle_name, :last_name => emp.last_name, :contact_no => emp.contact_no}} : []
  end

  def reject_plan
    plan_id = params[:plan_id]
    plan = EmployeePlan.find(plan_id)
    reject_plan = plan.update(current_status: "Rejected", status: "false")
    render :status=>200, :json=>{:status=>"Employee Plan Successfully Rejected."}
  end

  def on_duty_requests
    employee_id = params[:employee_id]
    on_duty_requests = OnDutyRequest.where('employee_id = ?', employee_id ).order("id DESC")
    render :json => on_duty_requests.present? ? on_duty_requests.collect{|odr| {:id => odr.id, :employee_id => odr.employee_id, :leave_type => odr.leave_type, :start_date => odr.start_date, :end_date => odr.end_date, :no_of_day => odr.no_of_day, :reason => odr.reason, :first_half => odr.first_half, :last_half => odr.last_half,:present_status => odr.present_status,:first_reporter_id => odr.first_reporter_id, :second_reporter_id => odr.second_reporter_id, :current_status => odr.current_status,:is_pending => odr.is_pending,:is_cancelled => odr.is_cancelled,:is_first_approved => odr.is_first_approved,:is_second_approved => odr.is_second_approved,:is_first_rejected => odr.is_first_rejected,:is_second_rejected => odr.is_second_rejected, :status => odr.od_status_records}} : []
  end

  def on_duty_requests_cancel
    employee_id = params[:employee_id]
    on_duty_request_id = params[:on_duty_request]
    on_duty_request = OnDutyRequest.find(on_duty_request_id)
    on_duty_request.update(is_cancelled: true,current_status: 'Cancelled')
    OdRecord.where(on_duty_request_id: on_duty_request_id).update_all(status: 'Cancelled')
    OdStatusRecord.create(on_duty_request_id: on_duty_request_id, employee_id: employee_id, status: 'Cancelled', change_date: Date.today)
    # if on_duty_request.first_reporter.email.nil? || on_duty_request.first_reporter.email == ''
    #   render :status=>200, :json=>{:status=>"Leave Cancelled Successfully without email.."}
    # else
    #   OdRequestMailer.cancel(on_duty_request).deliver_now
    render :status=>200, :json=>{:status=>"OD Cancelled Successfully."}
    # end
  end
                                                                                                                                                          
  def all_employee_plan_list
    employeeplan = EmployeePlan.all
    render :json => employeeplan.present? ? employeeplan.collect{|emppl| {:id => emppl.id, :employee_id => emppl.employee_id, :prefix => emppl.employee.try(:prefix), :employee_first_name => emppl.employee.try(:first_name), :employee_middle_name => emppl.employee.try(:middle_name), :employee_last_name => emppl.employee.try(:last_name), :from_date => emppl.from_date, :to_date => emppl.to_date, :from_time => emppl.from_time, :to_time => emppl.to_time,:meeting_with => emppl.meeting_with,:location => emppl.location,:meeting_agenda => emppl.meeting_agenda,:conform => emppl.conform,:status => emppl.status,:current_status => emppl.current_status,:manager_id => emppl.manager_id,:latitude => emppl.latitude,:longitude => emppl.longitude}} : []
  end

  def all_aprove_plan_list
    employeeplan = EmployeePlan.where(current_status: "Pending")
    render :json => employeeplan.present? ? employeeplan.collect{|emppl| {:id => emppl.id, :employee_id => emppl.employee_id, :prefix => emppl.employee.try(:prefix), :employee_first_name => emppl.employee.try(:first_name), :employee_middle_name => emppl.employee.try(:middle_name), :employee_last_name => emppl.employee.try(:last_name),:from_date => emppl.from_date, :to_date => emppl.to_date, :from_time => emppl.from_time, :to_time => emppl.to_time,:meeting_with => emppl.meeting_with,:location => emppl.location,:meeting_agenda => emppl.meeting_agenda,:conform => emppl.conform,:status => emppl.status,:current_status => emppl.current_status,:manager_id => emppl.manager_id,:latitude => emppl.latitude,:longitude => emppl.longitude}} : []
  end

  def create_on_duty_requests
    employee_id = params[:employee_id]
    start_date = params[:start_date]
    end_date = params[:end_date]
    reason = params[:reason]
    leave_type = params[:od_type]
    status  = ''
    if leave_type.empty?
      @on_duty_request = OnDutyRequest.new(employee_id: employee_id, leave_type: "Full Day", start_date: start_date, end_date: end_date, reason: reason)
    else
      @on_duty_request = OnDutyRequest.new(employee_id: employee_id, leave_type: leave_type, start_date: start_date, end_date: end_date, reason: reason)
    end
    @employee = Employee.find(@on_duty_request.employee_id)
      # if params[:flag] == "Full/Half"
      #   @on_duty_request.last_half = params[:common][:last_half]
      #   @on_duty_request.first_half = params[:common][:first_half]
      #   @on_duty_request.present_status = params[:common][:present_status]
      #   @checkbox = true
      # else
      #   @checkbox = false
      # end
    payroll_period = PayrollPeriod.where(status: true).take
    if payroll_period.nil?
      status = "Payroll Period Not set!"
        # flash[:alert] = "Payroll Period Not set!"
        # redirect_to new_on_duty_request_path
    else
      if  start_date.to_date >= payroll_period.from.to_date && end_date.to_date <= payroll_period.to.to_date
        if @on_duty_request.is_available?
          # flash[:alert] = "Your Request already has been sent"
          status = "Your Request already has been sent"
          if employee_id == @on_duty_request.employee_id
              # redirect_to new_on_duty_request_path
          else
              # redirect_to employee_list_on_duty_requests_path
          end
        elsif @on_duty_request.end_date == nil
          # flash[:alert] = "please Fill all mendatory fields"
          status = "Payroll Period Not set!"
          if employee_id == @on_duty_request.employee_id
            # redirect_to new_on_duty_request_path
          else
            # redirect_to employee_list_on_duty_requests_path
          end
        elsif @on_duty_request.is_salary_processed?
          # flash[:alert] = "Salary Processed for this month"
          status = "Salary Processed for this month"
          if employee_id == @on_duty_request.employee_id
              # redirect_to new_on_duty_request_path
          else
              # redirect_to employee_list_on_duty_requests_path
          end
        else
          if @employee.manager_id.nil?
            # flash[:alert] = 'Reporting manager not set please set Reporting Manager'
            status = "Reporting manager not set please set Reporting Manager"
            if employee_id == @on_duty_request.employee_id
                # redirect_to new_on_duty_request_path
            else
              # redirect_to employee_list_on_duty_requests_path
            end
          else
            @on_duty_request.is_pending = true
            @on_duty_request.current_status = 'Pending'
            @on_duty_request.first_reporter_id = @employee.manager_id
            if @on_duty_request.leave_type == 'Full Day'
               @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 1
            elsif @on_duty_request.leave_type == 'Full/Half'
              if @on_duty_request.last_half == true && @on_duty_request.first_half == true
                 @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f
              elsif @on_duty_request.first_half == true || @on_duty_request.last_half == true
                 @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 0.5
              else
                @on_duty_request.no_of_day = (@on_duty_request.end_date.to_date - @on_duty_request.start_date.to_date).to_f + 0.5
              end  
            elsif @on_duty_request.leave_type == 'Half Day'
              if @on_duty_request.first_half == true || @on_duty_request.last_half == true
                 @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
              elsif @on_duty_request.last_half == true && @on_duty_request.last_half == true
                 @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
              else
                 @on_duty_request.no_of_day = @on_duty_request.no_of_day.to_f + 0.5
              end
            end
            @on_duty_request.is_cancelled = false
            @on_duty_request.is_first_approved = false
            @on_duty_request.is_first_rejected = false
            @on_duty_request.is_second_approved = false
            @on_duty_request.is_second_rejected = false
            @on_duty_request.save
              if @on_duty_request.leave_type == 'Half Day'
                if @on_duty_request.first_half == true && @on_duty_request.last_half == true
                  @on_duty_request.update(first_half: false,last_half: true)
                elsif @on_duty_request.first_half == false && @on_duty_request.last_half == false
                  @on_duty_request.update(first_half: false,last_half: true)
                else @on_duty_request.first_half == true || @on_duty_request.last_half == true
                  @on_duty_request.save
                end
              end
              # for i in @on_duty_request.start_date.to_date..@on_duty_request.end_date.to_date
              #   OdRecord.create(employee_id: @employee.id,on_duty_request_id: @on_duty_request.id,status: 'Pending',day: i)
              # end
              @on_duty_request.create_attendance_od
              OdStatusRecord.create(employee_id: @employee.id,on_duty_request_id: @on_duty_request.id,status: 'Pending',change_date: Date.today)
              if @employee.manager.email.nil? or @employee.manager.email == ""
                  # flash[:notice] = "Send request without email."
                  status = "Send request without email."
              else
                # flash[:notice] = 'OD Request sent successfully.'
                status = "OD Request sent successfully."
                # OdRequestMailer.pending(@on_duty_request).deliver_now
              end
              if @on_duty_request.id != nil
                if @on_duty_request.leave_type == 'Full/Half'
                  if @on_duty_request.first_half == false && @on_duty_request.last_half == false
                     @on_duty_request.update(first_half: false,last_half: true)
                  end
                end
              else
                end
                  @od_record = OdRecord.where(on_duty_request_id: @on_duty_request.id).count
                  @on_duty_request.update(no_of_day: @od_record)
              # flash[:notice] = "Request Created Successfully"
              status = "Request Created Successfully"
              if employee_id == @on_duty_request.employee_id
                # redirect_to on_duty_requests_path
              else
                # redirect_to employee_list_on_duty_requests_path
              end
            end #manager_id nil
          end #is_available
        else #start_date == payroll_period.from.to_date
          if employee_id == @on_duty_request.employee_id
            # flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
            status = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
            # redirect_to on_duty_requests_path
          else
            # flash[:alert] = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
            status = "Please select date between #{payroll_period.from.to_date} to #{payroll_period.to.to_date}"
            # redirect_to employee_list_on_duty_requests_path
          end
        end
      end#payroll_period.nil?
    # end
    if status.empty?
      render :status=>200, :json=>{:status=> "Success"}
    else
      render :status=>200, :json=>{:status=> status}
    end
  end

  def list_of_faq
    frequest_questions = FrequestQuestion.where(status: true)
    render :json => frequest_questions.present? ? frequest_questions.collect{|faq| { :id => faq.id, :code => faq.code, :question => faq.question, :answer => faq.answer, :employee_id => faq.employee_id, :status => faq.status }} : []
  end

  def od_request_approval_list
    employee_id = params[:employee_id]
    emp = Employee.find(employee_id)
    employees = emp.subordinates
    employees_ind = emp.indirect_subordinates
    pending_on_duty_requests = OnDutyRequest.where(current_status: "Pending", employee_id: employees)
    # first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: employees_ind)  
    render :json => pending_on_duty_requests.present? ? pending_on_duty_requests.collect{|odral| { :id => odral.id, :employee_id => odral.employee_id, :manual_employee_code => odral.employee.manual_employee_code, :prefix => odral.employee.prefix, :employee_first_name => odral.employee.first_name, :employee_middle_name => odral.employee.middle_name, :employee_last_name => odral.employee.last_name, :leave_type => odral.leave_type, :start_date => odral.start_date, :end_date => odral.end_date, :no_of_day => odral.no_of_day, :first_half => odral.first_half, :last_half => odral.last_half, :present_status => odral.present_status, :first_reporter_id => odral.first_reporter_id, :second_reporter_id => odral.second_reporter_id, :current_status => odral.current_status, :is_pending => odral.is_pending, :is_cancelled => odral.is_cancelled, :is_first_approved => odral.is_first_approved, :is_second_approved => odral.is_second_approved, :is_first_rejected => odral.is_first_rejected, :is_second_rejected => odral.is_second_rejected }} : []
  end
 
  def od_employee_request_detail
    employee_id = params[:employee_id]
    od_request_id = params[:od_request_id]
    current_request = OnDutyRequest.find(od_request_id)
    on_duty_requests = OnDutyRequest.where(employee_id: employee_id).order("id DESC")
    render :json => on_duty_requests.present? ? on_duty_requests.collect{|odral| { :id => odral.id, :employee_id => odral.employee_id, :prefix => odral.employee.prefix, :employee_first_name => odral.employee.first_name, :employee_middle_name => odral.employee.middle_name, :employee_last_name => odral.employee.last_name, :leave_type => odral.leave_type, :start_date => odral.start_date, :end_date => odral.end_date, :no_of_day => odral.no_of_day, :first_half => odral.first_half, :last_half => odral.last_half, :present_status => odral.present_status, :first_reporter_id => odral.first_reporter_id, :second_reporter_id => odral.second_reporter_id, :current_status => odral.current_status, :is_pending => odral.is_pending, :is_cancelled => odral.is_cancelled, :is_first_approved => odral.is_first_approved, :is_second_approved => odral.is_second_approved, :is_first_rejected => odral.is_first_rejected, :is_second_rejected => odral.is_second_rejected }} : []
  end

  def od_request_first_approve
    employee_id = params[:employee_id]
    od_request_id = params[:od_request_id]
    on_duty_request = OnDutyRequest.find(od_request_id)
    if on_duty_request.employee.manager_2_id.nil?
      on_duty_request.update(is_first_approved: true, current_status: 'FinalApproved')
      OdRecord.where(on_duty_request_id: on_duty_request.id).update_all(status: 'FinalApproved')
      OdStatusRecord.create(on_duty_request_id: on_duty_request.id, employee_id: employee_id, status: 'FinalApproved', change_date: Date.today)
      #@on_duty_request.create_for_particular_od_record(@on_duty_request)
      on_duty_request.create_od_in_attendance
      OdRequestMailer.first_approve_final(on_duty_request).deliver_now
    else #manager_2 available
      on_duty_request.update(is_first_approved: true,current_status: 'FirstApproved',second_reporter_id: on_duty_request.employee.manager_2_id)
      OdRecord.where(on_duty_request_id: on_duty_request.id).update_all(status: 'FirstApproved')
      OdStatusRecord.create(on_duty_request_id: on_duty_request.id, employee_id: employee_id, status: 'FirstApproved', change_date: Date.today)
      # OdRequestMailer.first_approve(on_duty_request).deliver_now
    end
    render :status=>200, :json=>{:status=> "Approved Successfully"}
  end

  def od_request_second_approve
    employee_id = params[:employee_id]
    od_request_id = params[:od_req_id]
    on_duty_request = OnDutyRequest.find(od_request_id)
    on_duty_request.update(is_second_approved: true, current_status: 'FinalApproved')
    OdRecord.where(on_duty_request_id: on_duty_request.id).update_all(status: 'FinalApproved')
    OdStatusRecord.create(on_duty_request_id: on_duty_request.id, employee_id: employee_id, status: 'FinalApproved', change_date: Date.today)
    #@on_duty_request.create_for_particular_od_record(@on_duty_request)
    on_duty_request.create_od_in_attendance
    # OdRequestMailer.second_approve(on_duty_request).deliver_now
    render :status=>200, :json=>{:status=> "Approved Successfully"}
  end

  def od_request_first_reject
    employee_id = params[:employee_id]
    od_request_id = params[:od_request_id]
    on_duty_request = OnDutyRequest.find(od_request_id)
    on_duty_request.update(is_first_rejected: true, current_status: 'Rejected')
    OdRecord.where(on_duty_request_id: on_duty_request.id).update_all(status: 'Rejected')
    OdStatusRecord.create(on_duty_request_id: on_duty_request.id, employee_id: employee_id, status: 'Rejected', change_date: Date.today)
    # OdRequestMailer.first_reject(@on_duty_request).deliver_now
    render :status=>200, :json=>{:status=> "Rejected Successfully"}
  end

  def od_request_second_reject
    employee_id = params[:employee_id]
    od_request_id = params[:od_req_id]
    on_duty_request = OnDutyRequest.find(od_request_id)
    on_duty_request.update(is_second_rejected: true, current_status: 'Rejected')
    OdRecord.where(on_duty_request_id: on_duty_request.id).update_all(status: 'Rejected')
    OdStatusRecord.create(on_duty_request_id: on_duty_request.id, employee_id: employee_id, status: 'Rejected', change_date: Date.today)
    # OdRequestMailer.second_reject(@on_duty_request).deliver_now
    render :status=>200, :json=>{:status=> "Rejected Successfully"}
  end

  def comp_off_approval_first
    employee_id = params[:employee_id]
    current_login = Employee.find(employee_id)
    current_login_sub = current_login.subordinates
    current_login_ind = current_login.indirect_subordinates
    emp = current_login_sub + current_login_ind
    leave_c_off_pending = LeaveCOff.where(employee_id: current_login_sub, is_taken: false, status: false, is_expire: false, current_status: "Pending")
    render :json => leave_c_off_pending.present? ? leave_c_off_pending.collect{|lcop| { :id => lcop.id, :employee_id => lcop.employee_id, :c_off_date => lcop.c_off_date, :c_off_type => lcop.c_off_type, :c_off_expire_day => lcop.c_off_expire_day, :expiry_status => lcop.expiry_status, :is_taken => lcop.is_taken, :expiry_date => lcop.expiry_date, :leave_count => lcop.leave_count, :is_expire => lcop.is_expire, :status => lcop.status, :current_status => lcop.current_status, :taken_date => lcop.taken_date, :comment => lcop.comment }} : []
  end

  def comp_off_approval_second
    employee_id = params[:employee_id]
    current_login = Employee.find(employee_id)
    current_login_sub = current_login.subordinates
    current_login_ind = current_login.indirect_subordinates
    emp = current_login_sub + current_login_ind
    leave_c_off_first_approved = LeaveCOff.where(employee_id: current_login_sub, is_taken: false, status: false, is_expire: false, current_status: "FirstApproved")
    render :json => leave_c_off_first_approved.present? ? leave_c_off_first_approved.collect{|lcop| { :id => lcop.id, :employee_id => lcop.employee_id, :c_off_date => lcop.c_off_date, :c_off_type => lcop.c_off_type, :c_off_expire_day => lcop.c_off_expire_day, :expiry_status => lcop.expiry_status, :is_taken => lcop.is_taken, :expiry_date => lcop.expiry_date, :leave_count => lcop.leave_count, :is_expire => lcop.is_expire, :status => lcop.status, :current_status => lcop.current_status, :taken_date => lcop.taken_date, :comment => lcop.comment }} : []
  end

  def resignation_history
    employee_id = params[:employee_id]
    employee_resignations = EmployeeResignation.where(employee_id: employee_id)
    render :json => employee_resignations.present? ? employee_resignations.collect{|emppl| {:id => emppl.id, :employee_id => emppl.employee_id, :prefix => emppl.employee.prefix, :employee_first_name => emppl.employee.first_name, :employee_middle_name => emppl.employee.middle_name, :employee_last_name => emppl.employee.last_name, :resignation_date => emppl.resignation_date, :is_notice_period => emppl.is_notice_period, :notice_period => emppl.notice_period, :short_notice_period => emppl.short_notice_period, :tentative_leaving_date => emppl.tentative_leaving_date, :remark => emppl.remark, :exit_interview_date => emppl.exit_interview_date, :note => emppl.note, :leaving_date => emppl.leaving_date, :settled_on => emppl.settled_on,:resign_status => emppl.resign_status }} : []
  end

  def employee_feedback
    employee_plan_id = params[:plan_id]
    feedback = params[:feedback]
    emp_plan = EmployeePlan.find(employee_plan_id)
    emp_feedback = emp_plan.update(feedback: feedback)
    render :status=>200, :json=>{:status=>"Employee Feedback Successfully Updated."}
  end

  def employee_reason
    reason_id = params[:reason_id]
    employee_plan_id = params[:plan_id]
    feedback = params[:justification]
    emp_plan = EmployeePlan.find(employee_plan_id)
    emp_reason = emp_plan.update(plan_reason_master_id: reason_id, feedback: feedback)
    render :status=>200, :json=>{:status=>"Employee Reason Successfully Updated."}
  end

  def plan_reason_list
    plan_reason_list = PlanReasonMaster.all
    render :json => plan_reason_list.present? ? plan_reason_list.collect{|prlist| { :id => prlist.id, :code => prlist.code, :name => prlist.name, :description => prlist.description, :status => prlist.status }} : []
  end

  def show_self_datewise_attendance
    @from = params[:from_date]
    @to = params[:to_date]
    employee_id = params[:employee_id]
    employee_attendances = EmployeeAttendance.where(day: @from.to_date..@to.to_date, employee_id: employee_id).order("day DESC")
    render :json => employee_attendances.present? ? employee_attendances.collect{|dateatt| { :id => dateatt.id, :employee_id => dateatt.employee_id, :day => dateatt.day, :present => dateatt.present, :in_time => dateatt.in_time, :out_time => dateatt.out_time, :machine_attendance_id => dateatt.machine_attendance_id, :is_confirm => dateatt.is_confirm, :department_id => dateatt.department_id, :count => dateatt.count, :employee_leav_request_id => dateatt.employee_leav_request_id }} : []
  end

  def attendance_data
    employee_id = params[:employee_id]
    date = params[:date]
    in_time = params[:in_time]
    latitude = params[:latitude]
    longitude = params[:longitude]
    place = params[:place]
    emp = Employee.find(employee_id)
    emp_code = emp.manual_employee_code
    DailyAttendance.create(employee_code: emp_code, date: date, time: in_time, latitude: latitude, longitude: longitude, place: place) 
    render :status=>200, :json=>{:status=>"Attendance Successfully Store."}
  end

  def employee_daily_attendance
    employee_id = params[:employee_id]
    emp = Employee.find(employee_id)
    emp_code = emp.manual_employee_code
    date = params[:date]
    emp_daily_att = DailyAttendance.where(employee_code: emp_code, date: date)
    render :json => emp_daily_att.present? ? emp_daily_att.collect{|eda| { :id => eda.id, :date => eda.date, :time => eda.time.strftime("%I:%M:%S %p"), :employee_code => eda.employee_code, :latitude => eda.latitude, :longitude => eda.longitude, :place => eda.place }} : []
  end

  def admin_all_leave_request_list
    first_level_request_lists = EmployeeLeavRequest.where("current_status = ? OR current_status = ?", "Pending", "FirstApproved")
    # @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
    # @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @emp_leav_req)
    render :json => first_level_request_lists.present? ? first_level_request_lists.collect{|adminlr| { :id => adminlr.id, :employee_id => adminlr.employee_id, :prefix => adminlr.employee.prefix, :employee_first_name => adminlr.employee.first_name, :employee_middle_name => adminlr.employee.middle_name, :employee_last_name => adminlr.employee.last_name, :leav_category_id => adminlr.leav_category_id, :leave_type => adminlr.leave_type, :start_date => adminlr.start_date, :end_date => adminlr.end_date, :reason => adminlr.reason, :first_reporter_id => adminlr.first_reporter_id, :second_reporter_id => adminlr.second_reporter_id, :manual_employee_code => adminlr.employee.manual_employee_code, :leav_category => adminlr.leav_category.name, :leave_count => adminlr.leave_count, :start_date => adminlr.start_date, :end_date => adminlr.end_date, :current_status => adminlr.current_status, :reason => adminlr.reason }} : []
  end

  def admin_employee_history
    leave_req_id = params[:leave_req_id]
    current_request = EmployeeLeavRequest.find(leave_req_id)
    employee = Employee.find(current_request.employee_id)
    employee_leav_requests = employee.employee_leav_requests.order("id DESC")
    render :json => employee_leav_requests.present? ? employee_leav_requests.collect{|adminlr| { :id => adminlr.id, :employee_id => adminlr.employee_id, :prefix => adminlr.employee.prefix, :employee_first_name => adminlr.employee.first_name, :employee_middle_name => adminlr.employee.middle_name, :employee_last_name => adminlr.employee.last_name, :leav_category => adminlr.leav_category.name, :leave_count => adminlr.leave_count, :leave_type => adminlr.leave_type_re }} : []
  end

  def employee_location_history
    emp_id = params[:employee_id]
    date_time = params[:date_time]
    time = Time.now.to_time.strftime("%H:%M")
    date = Time.now.to_date.strftime("%Y-%m-%d")
    # time = params[:time]
    lon = params[:latitude].to_f
    lat = params[:longitude].to_f
    longitude = lon.round(4)
    latitude = lat.round(4)
    location = params[:place]
    emp_history = EmployeeLocationHistory.where(employee_id: emp_id, date: date)
    emp_last_history = EmployeeLocationHistory.where(employee_id: emp_id, date: date).last
    emp_count = emp_history.count
    # binding.pry
    # byebug
    if emp_count >= 2
      last_lat = emp_last_history.latitude
      last_lon = emp_last_history.longitude
      if latitude == last_lat && longitude == last_lon
        emp_last_history.update(employee_id: emp_id, date: date, time: time, latitude: latitude, longitude: longitude, location: location)
        render :status=>200, :json=>{:status=>"Employee Attendance Successfully updated."}
      else
        EmployeeLocationHistory.create(employee_id: emp_id, date: date, time: time, latitude: latitude, longitude: longitude, location: location) 
        render :status=>200, :json=>{:status=>"Employee Attendance Successfully created 1."}
      end
    else
      emp_loc_his = EmployeeLocationHistory.create(employee_id: emp_id, date: date, time: time, latitude: latitude, longitude: longitude, location: location)
      render :status=>200, :json=>{:status=>"Employee Attendance Successfully created 2."}
    end
  end

  def daily_att_count
    employee_id = params[:employee_id]
    emp = Employee.find(employee_id)
    emp_code = emp.manual_employee_code
    date = params[:date]
    count = DailyAttendance.where(employee_code: emp_code, date: date).count
    render :status=>200, :json=>{:count=> count }
  end

  def date_wise_location_history
    employee_id = params[:employee_id]
    date = params[:date]
    date_wise_history = EmployeeLocationHistory.where(employee_id: employee_id, date_time: date)                                                                 
    render :json => date_wise_history.present? ? date_wise_history.collect{|dwh| { :employee_id => dwh.employee_id, :date_time => dwh.date_time, :latitude => dwh.latitude, :longitude => dwh.longitude, :location => dwh.location }} : []
  end

  def company_logo
    company_details = Company.first
    render :status=>200, :json=>{:company_name => company_details.name, :company_logo => company_details.company_logo.url }
  end

  def admin_od_request_approval_list
    pending_on_duty_requests = OnDutyRequest.where(current_status: "Pending")
    # first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: employees_ind)  
    render :json => pending_on_duty_requests.present? ? pending_on_duty_requests.collect{|odral| { :id => odral.id, :employee_id => odral.employee_id, :manual_employee_code => odral.employee.manual_employee_code, :prefix => odral.employee.prefix, :employee_first_name => odral.employee.first_name, :employee_middle_name => odral.employee.middle_name, :employee_last_name => odral.employee.last_name, :leave_type => odral.leave_type, :start_date => odral.start_date, :end_date => odral.end_date, :no_of_day => odral.no_of_day, :first_half => odral.first_half, :last_half => odral.last_half, :present_status => odral.present_status, :first_reporter_id => odral.first_reporter_id, :second_reporter_id => odral.second_reporter_id, :current_status => odral.current_status, :is_pending => odral.is_pending, :is_cancelled => odral.is_cancelled, :is_first_approved => odral.is_first_approved, :is_second_approved => odral.is_second_approved, :is_first_rejected => odral.is_first_rejected, :is_second_rejected => odral.is_second_rejected }} : []
  end

  def current_location_particular_emp
    emp_id = params[:employee_id]
    elh = EmployeeLocationHistory.where(employee_id: emp_id).last
    if elh.present?
      render :status=>200, :json=>{ :id => elh.id, :employee_id => elh.employee_id, :date_time => elh.date_time, :latitude => elh.latitude, :longitude => elh.longitude, :location => elh.location }
    else
      render :status=>200, :json=>{:status=>"Employee location history not Found..."}
    end
  end

  def project_master_list
    project = ProjectMaster.all
    render :json => project.present? ? project.collect{|pro| { :id => pro.id, :code => pro.code, :name => pro.name, :description => pro.description, :is_confirm => pro.is_confirm }} : []
  end

  def emp_daily_activity
    project_master_id = params[:project_list]
    employee_id = params[:employee_id]
    today_activity = params[:today_activity]
    tomorrow_plan = params[:tomorrow_plan]
    day = params[:date]
    EmployeeDailyActivity.create(employee_id: employee_id, project_master_id: project_master_id, today_activity: today_activity, tomorrow_plan: tomorrow_plan, day: day)
    render :status=>200, :json=>{:status=>"Employee Daily Activity Successfully Updated.."}
  end

  def emp_activity
    employee_id = params[:employee_id]
    emp_activity = EmployeeDailyActivity.where(employee_id: employee_id)
    render :json => emp_activity.present? ? emp_activity.collect{|emp| { :employee_id => emp.employee_id, :project_master_id => emp.project_master_id, :today_activity => emp.today_activity, :tomorrow_plan => tomorrow_plan, :day => day }} : []
  end

  def emp_details_salary_slip
    employee_id = params[:employee_id]
    emp_details = Employee.where(id: employee_id)
    render :json => emp_details.present? ? emp_details.collect{|e| {:id => e.id, :passport_photo_file_name => e.passport_photo_file_name, :manual_employee_code => e.manual_employee_code, :prefix => e.prefix, :first_name => e.first_name, :middle_name => e.middle_name, :last_name => e.last_name, :date_of_birth => e.date_of_birth, :gender => e.gender,:contact_no => e.contact_no,:email => e.email,:permanent_address => e.permanent_address,:country_id => e.country_id,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:blood_group_id => e.blood_group.try(:name), :employee_type_id => e.employee_type.try(:name),:nationality_id => e.nationality.try(:name),:company_id => e.company.try(:name),:department_id => e.department.try(:name),:sub_department_id => e.sub_department.try(:name), :employee_designation => e.joining_detail.employee_designation.try(:name), :employee_uan_no => e.joining_detail.employee_uan_no, :account_no => e.try(:employee_bank_detail).try(:account_no), :employee_pf_no => e.try(:joining_detail).try(:employee_pf_no), :company_location => e.try(:company_location).try(:name) }} : []
  end

  def emp_salary_slip_list
    emp_id = params[:employee_id]
    salray_slips = Salaryslip.where('employee_id= ?', emp_id).order('salary_slip_code desc').only(:order, :where)
    render :json => salray_slips.present? ? salray_slips.collect{|sal| { :id => sal.id, :employee_id => sal.employee_id, :salary_slip_code => sal.salary_slip_code, :workingday_id => sal.workingday_id, :actual_gross_salary => sal.actual_gross_salary, :actual_total_deduction => sal.actual_total_deduction, :actual_net_salary => sal.actual_net_salary, :salary_template_id => sal.salary_template_id, :month => sal.month, :year => sal.year, :calculated_gross_salary => sal.calculated_gross_salary, :calculated_total_deduction => sal.calculated_total_deduction, :calculated_net_salary => sal.calculated_net_salary, :month_year => sal.month_year, :employee_template_id => sal.employee_template_id, :arrear_actual_amount => sal.arrear_actual_amount, :arrear_calculated_amount => sal.arrear_calculated_amount, :is_confirm => sal.is_confirm, :working_day => sal.try(:workingday).try(:day_in_month), :payable_day => sal.try(:workingday).try(:payable_day) }} : []
  end

  def emp_salary_slip_data
    slip_id = params[:salaryslip_id]
    id = Salaryslip.find(slip_id)
    employee = Employee.find(id.employee_id)
    if employee.present?
      render :status=>200, :json=>{ :id => employee.id, :passport_photo_file_name => employee.passport_photo_file_name, :manual_employee_code => employee.manual_employee_code, :prefix => employee.prefix, :first_name => employee.first_name, :middle_name => employee.middle_name, :last_name => employee.last_name, :date_of_birth => employee.date_of_birth, :gender => employee.gender,:contact_no => employee.contact_no,:email => employee.email,:permanent_address => employee.permanent_address,:country_id => employee.country_id,:pin_code => employee.pin_code,:current_address => employee.current_address,:adhar_no => employee.adhar_no,:pan_no => employee.pan_no,:blood_group_id => employee.blood_group.try(:name), :employee_type_id => employee.employee_type.try(:name),:nationality_id => employee.nationality.try(:name),:company_id => employee.company.try(:name),:department_id => employee.department.try(:name),:sub_department_id => employee.sub_department.try(:name), :employee_designation => employee.joining_detail.employee_designation.try(:name), :employee_uan_no => employee.joining_detail.employee_uan_no, :account_no => employee.try(:employee_bank_detail).try(:account_no), :employee_pf_no => employee.try(:joining_detail).try(:employee_pf_no), :company_location => employee.try(:company_location).try(:name) }
    else
      render :status=>200, :json=>{:status=>"Employee location history not found..."}
    end
  end

  def emp_addable_salary_details
    salaryslip_id = params[:salaryslip_id]
    addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, salaryslip_id)
    render :json => addable_salary_components.present? ? addable_salary_components.collect{|sal| { :id => sal.id, :salaryslip_id => sal.salaryslip_id, :salary_component_id => sal.salary_component_id, :actual_amount => sal.actual_amount, :is_deducted => sal.is_deducted, :other_component_name => sal.other_component_name, :calculated_amount => sal.calculated_amount, :employee_template_id => sal.employee_template_id, :is_arrear => sal.is_arrear }} : []
  end

  def emp_deducted_salary_details
    salaryslip_id = params[:salaryslip_id]
    deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, salaryslip_id)
    render :json => deducted_salary_components.present? ? deducted_salary_components.collect{|sal| { :id => sal.id, :salaryslip_id => sal.salaryslip_id, :salary_component_id => sal.salary_component_id, :actual_amount => sal.actual_amount, :is_deducted => sal.is_deducted, :other_component_name => sal.other_component_name, :calculated_amount => sal.calculated_amount, :employee_template_id => sal.employee_template_id, :is_arrear => sal.is_arrear }} : []
  end

  def emp_daily_activity_list
    employee = params[:employee_id]
    emp_daily_list = EmployeeDailyActivity.where(employee_id: employee)
    render :json => emp_daily_list.present? ? emp_daily_list.collect{|sal| { :id => sal.id, :employee_id => sal.employee_id, :prefix => sal.employee.try(:prefix), :first_name => sal.employee.try(:first_name), :middle_name => sal.employee.try(:middle_name), :last_name => sal.employee.try(:last_name), :project_master_id => sal.try(:project_master).try(:name), :today_activity => sal.today_activity, :tomorrow_plan => sal.tomorrow_plan, :day => sal.day }} : []
  end

  def employee_wise_attendance
    emp_id = params[:employee_id]
    emp_att = EmployeeAttendance.where(employee_id: emp_id)
    if emp_att.present?
      render :json => emp_att.present? ? emp_att.collect{|emp_att| { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present }} : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

end

