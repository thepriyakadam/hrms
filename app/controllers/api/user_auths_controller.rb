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
        render :status=>200, :json=>{ :member_id => @user.id, :manual_member_code => @user.manual_member_code, :gender => @user.try(:employee).try(:gender), :id => @user.employee_id, :role => @user.role.name, :avatar_file_name => @user.avatar_file_name }
      end
    end
  end

  def employee_list
    @employee = params[:employee_id]
    employees = Employee.where(id: @employee)
    render :json => employees.present? ? employees.collect{|e| {:id => e.try(:id),:passport_photo_file_name => e.try(:passport_photo_file_name),:manual_employee_code => e.try(:manual_employee_code),:first_name => e.try(:first_name),:middle_name => e.try(:middle_name),:last_name => e.try(:last_name),:date_of_birth => e.try(:date_of_birth),:gender => e.try(:gender),:contact_no => e.try(:contact_no),:optinal_contact_no => e.try(:optinal_contact_no),:optinal_contact_no1 => e.try(:optinal_contact_no1),:email => e.try(:email),:optional_email => e.try(:optional_email),:permanent_address => e.try(:permanent_address),:country_id => e.try(:country_id),:state_id => e.try(:state).try(:name),:district_id => e.try(:district).try(:name),:city => e.try(:city),:pin_code => e.try(:pin_code),:current_address => e.try(:current_address),:adhar_no => e.try(:adhar_no),:pan_no => e.try(:pan_no),:licence_no => e.try(:licence_no),:marital_status => e.try(:marital_status),:blood_group_id => e.try(:blood_group).try(:name),:employee_type_id => e.try(:employee_type).try(:name),:nationality_id => e.try(:nationality).try(:name),:religion_id => e.try(:religion).try(:name),:handicap => e.try(:handicap),:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.try(:company).try(:name),:company_location_id => e.try(:company_location).try(:name),:department_id => e.try(:department).try(:name),:sub_department_id => e.try(:sub_department).try(:name), :emergency_contact_no => e.try(:emergency_contact_no), :employee_designation => e.joining_detail.try(:employee_designation).try(:name), :employee_uan_no => e.try(:joining_detail).try(:employee_uan_no) }} : []
  end

  def leave_coff
    @employee = params[:employee_id]
    leave_coff = LeaveCOff.where(taken_date: nil,current_status: "FinalApproved", employee_id: @employee).collect { |x| [x.c_off_date.to_s + ' - ' + x.c_off_date.strftime("%A").to_s, x.id] }
    render :json => leave_coff.present? ? leave_coff.collect{|coff| {:id => coff.try(:id), :employee_id => coff.try(:employee_id), :c_off_date => coff.try(:c_off_date), :c_off_type => coff.try(:c_off_type),:c_off_expire_day => coff.try(:c_off_expire_day),:expiry_status => coff.try(:expiry_status),:is_taken => coff.try(:is_taken),:expiry_date => coff.try(:expiry_date),:leave_count => coff.try(:leave_count),:is_expire => coff.try(:is_expire),:created_at => coff.try(:created_at),:status => coff.try(:status),:current_status => coff.try(:current_status),:taken_date => coff.try(:taken_date), :comment => coff.try(:comment) }} : []
  end
    
  def leave_request
    @leave_user = params[:employee_id]
    @employee = Employee.where(id: @leave_user)
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    employee_leav_balances = EmployeeLeavBalance.where(employee_id: @leave_user).where(is_active: true)
    render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id, :employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count, :collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
  end

  def leave_category
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    leav_categories = LeavCategory.where(is_active: true)
    render :json => leav_categories.present? ? leav_categories.collect{|lc| {:id => lc.id, :name => lc.name, :code => lc.code }} : []
  end

  def check_leave_request
    @leave_user = params[:employee_id]
    @employee = Employee.where(id: @leave_user)
    # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
    employee_leav_balances = EmployeeLeavBalance.where(employee_id: @leave_user)
    render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id,:employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count, :collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
  end

  def all_leave_request_list
    @employee_id = params[:employee_id].to_i
    if @employee_id.present?
      leave_list = EmployeeLeavRequest.where(employee_id: @employee_id).order("id DESC")
      render :json => leave_list.present? ? leave_list.collect{|ll| { :id => ll.id, :manual_employee_code => ll.try(:employee).try(:manual_employee_code), :employee_id => ll.employee_id, :leav_category_initial => ll.leav_category.try(:code), :leav_category_id => ll.leav_category.try(:name), :leave_type => ll.leave_type, :start_date => ll.start_date, :end_date => ll.end_date, :reason=> ll.reason, :current_status=> ll.current_status, :no_of_day => ll.leave_count, :leave_status_records => ll.leave_status_records }} : []
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
          # LeaveRequestMailer.cancel(@employee_leav_request).deliver_now
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
          s.change_status_employee_id = employee_id unless current_user.class == Group
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
              # LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully."}
            else
              # redirect_to all_leave_request_list_employee_leav_requests_path
              #LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
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
          s.change_status_employee_id = employee_id unless current_user.class == Group
          s.status = 'FirstApproved'
          s.change_date = Time.now
          LeaveRecord.where(employee_leav_request_id: @employee_leav_request.id).update_all(status: "FirstApproved")
        end
        ActiveRecord::Base.transaction do
          if @leave_status.save
            @employee_leav_request.update(is_first_approved: true, current_status: 'FirstApproved', second_reporter_id: @employee_leav_request.employee.manager_2_id)
            if @employee_leav_request.first_reporter_id == employee_id
              # redirect_to approved_or_rejected_leave_request_employee_leav_requests_path
              # LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
              # flash[:notice] = 'Leave Request Approved Successfully.'
              render :status=>200, :json=>{:status=>"Leave Request Approved Successfully."}
            else
              # redirect_to all_leave_request_list_employee_leav_requests_path
              #LeaveRequestMailer.first_approve(@employee_leav_request).deliver_now
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
        s.change_status_employee_id = employee_id unless current_user.class == Group
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
        #LeaveRequestMailer.first_approve1(@employee_leav_request).deliver_now
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
         # LeaveRequestMailer.second_reject(@employee_leav_request).deliver_now
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

  def empoyee_leave_request
    employee = params[:employee_id]
    @employee = Employee.find(employee)
    start_date = params[:from_date]
    @end_date = params[:to_date]
    @leave_type = params[:leave_type]
    @first_half = params[:first_half]
    @last_half = params[:last_half]
    @c_off_date = params[:c_off_date]
    @half_day_present = params[:half_day_present]
    leav_category = LeavCategory.find_by(code: "C.Off")
    @leave_c_offs = LeaveCOff.where(employee_id: @employee.id)
    @leav_category = params[:leave_catagory]
    payroll_period = PayrollPeriod.where(status: true).take
    @reason = params[:reason]
    first_reporter_id = params[:manager1_id]
    second_reporter_id = params[:manager2_id]

    @employee_leav_request = EmployeeLeavRequest.new(employee_id: employee, leav_category_id: @leav_category, leave_type: @leave_type, first_half: @first_half, last_half: @last_half, start_date: start_date, end_date: @end_date, reason: @reason, first_reporter_id: first_reporter_id, second_reporter_id: second_reporter_id )
    @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee, @leave_category ,true).take

    #c_off
    if @leav_category == leav_category.id
      end_date = @end_date
      @leave_c_off_id = @c_off_date
      if end_date == "" || @leave_c_off_id == "" || @leave_c_off_id == nil
       status = "Please Fill mendatory Fields"
      else#end_date == nil
       @leave_c_off_id = @c_off_date
        @leave_c_off = LeaveCOff.find_by(id: @leave_c_off_id)
        if start_date.to_date > @leave_c_off.c_off_date.to_date
              if @leave_c_off.expiry_date == nil
              else
                if @leave_c_off.expiry_date < start_date.to_date
                  status = "Compensatory off expired for this day"
                elsif @leave_c_off.c_off_date > start_date.to_date
                  status = "Please check Compensatory off day"
                end#@leave_c_off.expiry_date
              end#@leave_c_off.expiry_date == nil
              if @employee_leav_request.is_available_coff?
                status = "Your Leave Request already has been sent"
              elsif @employee_leav_request.is_salary_processed_coff?
                status = "Salary Processed for this month"
              elsif @employee.manager_id.nil?
                status = 'Reporting manager not set please set Reporting Manager'
              else
                @employee_leav_request.first_reporter_id = @employee.manager_id
                @employee_leav_request.is_pending = true
                @employee_leav_request.current_status = 'Pending'
                if params[:flag] == "Full"
                  @employee_leav_request.leave_count = 1.0
                  @employee_leav_request.leave_type = "Full Day"
                else
                  @employee_leav_request.leave_count = 0.5
                  @employee_leav_request.leave_type = "Half Day"
                end
                @employee_leav_request.is_cancelled = false
                @employee_leav_request.is_first_approved = false
                @employee_leav_request.is_first_rejected = false
                @employee_leav_request.is_second_approved = false
                @employee_leav_request.is_second_rejected = false
                @employee_leav_request.end_date = start_date
                @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
                LeaveCOff.find_by(id: @leave_c_off_id).update(taken_date: start_date)
                @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id,status: "Pending", change_date: Date.today)
                @employee_leav_request.save
                @employee_leav_request.leave_record_create_coff(@employee_leav_request)
                unless @emp_leave_bal.nil?
                  no_of_leave = @emp_leave_bal.no_of_leave.to_f - @employee_leav_request.leave_count.to_f
                  @emp_leave_bal.update(no_of_leave: no_of_leave)
                  @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
                end
                status = "Created successfully!"
                LeaveRequestMailer.pending(@employee_leav_request).deliver_now    
              end#@employee_leav_request.is_available_coff?
        else#start_date.to_date > @leave_c_off.c_off_date.to_date
          status = "C.Off Not Available For #{start_date}"
        end#c_off_date
      end#end_date == nil
    else#c_off
      @emp_leav_req = EmployeeLeavRequest.where(employee_id: @employee.id, start_date: start_date,end_date: end_date)
      if params[:flag] == "Full/Half"
        @employee_leav_request.last_half = params[:common][:last_half]
        @employee_leav_request.first_half = params[:common][:first_half]
        @employee_leav_request.present_status = params[:common][:present_status]
        @checkbox = true
      else
        @checkbox = false
      end

      payroll_period = PayrollPeriod.where(status: true).take 
      @leav_category = LeavCategory.find_by(id: @employee_leav_request.leav_category_id)

      if start_date == "" || end_date == ""
        status = "Please fill all mandatory fields "
      else
        if @employee_leav_request.end_date == nil 
          status = "please Fill all mendatory fields"
        elsif @employee_leav_request.is_available?
          status = "Your Leave Request already has been sent status is Pending"
        elsif @employee_leav_request.is_first_approved?
          status = "Your Leave Request already has been sent status is First Approved"
        elsif @employee_leav_request.is_final_approved?
          status = "Request already has Approved"
        elsif @employee_leav_request.is_salary_processed?
          status = "Attendance Confirm Please Contact to Admin"
        elsif @employee_leav_request.is_continue?
          status = "Leave Can't take continueously"
        elsif @employee.manager_id.nil?
          status = 'Reporting manager not set please set Reporting Manager'
        else
          @employee_leav_request.first_reporter_id = @employee.manager_id
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
            end# @employee_leav_request.first_half == true
          elsif @employee_leav_request.leave_type == 'Half Day'
            @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 0.5
          elsif @employee_leav_request.leave_type == ''
            @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
          else
            @employee_leav_request.leave_count = (@employee_leav_request.end_date.to_date - @employee_leav_request.start_date.to_date).to_f + 1
          end#@employee_leav_request.leave_type == 'Full Day'
          @employee_leav_request.is_cancelled = false
          @employee_leav_request.is_first_approved = false
          @employee_leav_request.is_first_rejected = false
          @employee_leav_request.is_second_approved = false
          @employee_leav_request.is_second_rejected = false
          @emp_leave_bal = EmployeeLeavBalance.where('employee_id = ? AND leav_category_id = ? AND is_active = ?', @employee.id, @employee_leav_request.leav_category_id,true).take
          type = LeavCategory.find(@employee_leav_request.leav_category_id).is_payble 
          @leav_category = LeavCategory.find_by(id: @employee_leav_request.leav_category_id)
          monthly_count = @employee_leav_request.leave_monthly_limit(@employee_leav_request)
          if @leav_category.monthly_leave != nil && monthly_count > @leav_category.monthly_leave.to_f 
            flash[:alert] = "Leave Monthly Limit Extended !"
          elsif type == false
            @employee_leav_request.save
            @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id,status: "Pending", change_date: Date.today)
            @employee_leav_request.save
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
            if @employee.manager.email.nil? or @employee.manager.email == ""
              status = "Send request without email."
            else
              status = 'Leave Request sent successfully.'
              LeaveRequestMailer.pending(@employee_leav_request).deliver_now
            end
          elsif @leav_category.is_limit == true && @employee_leav_request.is_out_of_limit(@employee_leav_request)
            status = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}" 
          else
            @leave_category = LeavCategory.where(id: @employee_leav_request.leav_category_id,is_active: true).take
            if @leave_category.is_balance == true
              if @emp_leave_bal.nil?
                @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                status = 'Leave balance not set- contact to admin.'
              elsif @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
                @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee.id)
                status = 'Not Allowed. You exceed the leave limit.'
              elsif @employee_leav_request.try(:start_date).try(:to_date) < @emp_leave_bal.try(:from_date).try(:to_date)
                @emp_leave_bal1 =  EmployeeLeavBalance.where(employee_id: @employee.id,leav_category_id: @employee_leav_request.leav_category_id,is_active: false).last
                if @employee_leav_request.leave_count.to_f > @emp_leave_bal1.try(:no_of_leave).to_f
                  status = 'You Have No Balance For This Date'
                else
                  @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id, status: 'Pending', change_date: Date.today)
                  @employee_leav_request.save
                  @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
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
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    status = 'Send request without email.'
                  else
                    status = 'Leave Request sent successfully..'
                    LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                end#@employee_leav_request.leave_count.to_f > @emp_leave_bal1
                # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              elsif @leav_category.from.nil? or @leav_category.to.nil?
                # @employee_leav_request.leave_status_records.build(change_status_employee_id: employee.id, status: 'Pending', change_date: Date.today)
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
                  if @employee.manager.email.nil? || @employee.manager.email == ''
                    status = 'Send request without email.'
                  else
                    status = 'Leave Request sent successfully..'
                    LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                  end
                else
                end#@employee_leav_request.save
 
            elsif type == 'C.Off'
              @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id, status: 'Pending', change_date: Date.today)
              if @employee_leav_request.save
                @employee_leav_request.update(employee_leav_balance_id: @emp_leave_bal.id)
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
                if @employee.manager.email.nil? || @employee.manager.email == ''
                  status = 'Send request without email.'
                else
                  status = 'Leave Request sent successfully !!'
                  LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                end
              else
              end
            else
              @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id, status: 'Pending', change_date: Date.today)
              if @employee_leav_request.save
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
                if @employee.manager.email.nil? || @employee.manager.email == ''
                  status = 'Send request without email.'
                else
                  status = 'Leave Request sent successfully !'
                  LeaveRequestMailer.pending(@employee_leav_request).deliver_now
                end
              else
              end
            end#balance.nil?
          else #is_balance == true
          @employee_leav_request.leave_status_records.build(change_status_employee_id: @employee.id, status: 'Pending', change_date: Date.today)
          if @employee_leav_request.save
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
            if @employee.manager.email.nil? || @employee.manager.email == ''
              status = 'Send request without email.'
            else
              status = 'Leave Request sent successfully !'
            end
          else
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
  end
  end
  if status.empty?
    render :status=>200, :json=>{:status=> "Success"}
  else
    render :status=>200, :json=>{:status=> status}
  end
  end#def


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
    confirm = params[:confirm]
    status = params[:status]
    current_status = params[:current_status]
    company_name = params[:company_name] 
    plan_type = params[:plan_type]
    created_place = params[:current_place]
    current_date = params[:current_date]
    created_time = params[:current_time]
    current_latitude = params[:current_latitude]
    current_longitude = params[:current_longitude]
    manager_id = params[:manager_id].to_i
    created_date = params[:current_date]
    @employee_plan = EmployeePlan.where(employee_id: employee_id)
    if @employee_plan.present?
      employee_plan = @employee_plan.where(from_date: from_date.to_date, to_date: to_date.to_date).where.not(current_status: "Cancelled").where.not(current_status: "Rejected")
      if employee_plan.present?
        if from_plan = employee_plan.where("? BETWEEN from_time AND to_time", from_time).present? 
          render :status=>200, :json=>{:status=>"Sorry..!! This Time was already reserved..."}  
        elsif to_plan = employee_plan.where("? BETWEEN from_time AND to_time", to_time).present?
          render :status=>200, :json=>{:status=>"Sorry..!! This Time was already reserved..."}
        else
          if plan_type == false
            employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: "unplan", manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
          else
            employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: current_status, manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
          end
          if employee_plan.save
            render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
          else
            render :status=>200, :json=>{:status=>"Employee is not Found."}
          end
        end
      else
        if plan_type == false
          employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: "unplan", manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
        else
          employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: current_status, manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
        end
        if employee_plan.save
          render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
        else
          render :status=>200, :json=>{:status=>"Employee is not Found."}
        end
      end    
    else
      if plan_type == false
        employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: "unplan", manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
      else
        employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: current_status, manager_id: manager_id, listed_company_id: company_name, plan_or_unplan: plan_type, created_date: created_date, created_time: created_time)
      end
      if employee_plan.save
        render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
      else
        render :status=>200, :json=>{:status=>"Employee is not Found."}
      end
    end
  end

  def all_plan_list
    employee_plan = EmployeePlan.all
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id, :prefix => epl.employee.try(:prefix), :employee_first_name => epl.employee.try(:first_name), :employee_middle_name => epl.employee.try(:middle_name), :employee_last_name => epl.employee.try(:last_name), :from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time.utc.strftime("%H:%M"), :to_time => epl.to_time.utc.strftime("%H:%M"), :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :confirm => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master => epl.try(:plan_reason_master).try(:name), :reason => epl.feedback   }} : []
  end

  def particular_employee_plan_list
    employee_id = params[:employee_id]
    date = params[:date]
    employee_plan = EmployeePlan.where(employee_id: employee_id).order("from_date DESC")
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :start_time => epl.start_time, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time.utc.strftime("%H:%M"), :to_time => epl.to_time.utc.strftime("%H:%M"), :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :confirm => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master => epl.try(:plan_reason_master).try(:name), :reason => epl.feedback, :plan_or_unplan => epl.plan_or_unplan, :start_latitude => epl.start_latitude, :end_latitude => epl.end_latitude, :end_time => epl.end_time,:created_latitude => epl.created_latitude, :start_longitude => epl.start_longitude, :end_longitude => epl.end_longitude, :created_longitude => epl.created_longitude, :start_place => epl.start_place, :end_place => epl.start_place, :created_place => epl.created_place, :listed_company_id => epl.listed_company_id }} : []
  end

  def particular_emp_status_wise_plan_list
    employee_id = params[:employee_id]
    status = params[:status]
    if status == "All"
      employee_plan = EmployeePlan.where(employee_id: employee_id).order("id DESC")
    elsif status == "Attend"
      employee_plan = EmployeePlan.where('employee_id = ? AND plan_reason_master_id IS ?', employee_id, nil).order("id DESC")
    elsif status == "Not Attend"
      employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ?', nil).where(employee_id: employee_id).order("id DESC")
    elsif status.present? && status != "All" && status != "Attend" && status != "Not Attend"
      employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: status ).order("id DESC")
    else
      employee_plan = EmployeePlan.where(employee_id: employee_id).order("id DESC")
    end
    if employee_plan.present?
      render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time.utc.strftime("%H:%M"), :to_time => epl.to_time.utc.strftime("%H:%M"), :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :confirm => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master_id => epl.plan_reason_master.try(:name), :feedback => epl.feedback, :plan_or_unplan => epl.plan_or_unplan, :start_latitude => epl.start_latitude, :end_latitude => epl.end_latitude, :start_time  =>  epl.start_time, :end_time => epl.end_time,:created_latitude => epl.created_latitude, :start_longitude => epl.start_longitude, :end_longitude => epl.end_longitude, :created_longitude => epl.created_longitude, :start_place => epl.start_place, :end_place => epl.start_place, :created_place => epl.created_place, :listed_company_id => epl.listed_company_id }} : []
    else
      render :status=>200, :json=>{:status=>"Plan is not Found."}
    end
  end

  def employee_plan_list
    manager_id = params[:manager_id]
    employee_id = params[:employee_id]
    from_date = params[:fromdate]
    to_date = params[:todate]
    status = params[:status]
    if manager_id.empty?
      if status == "All"
        employee_plan = EmployeePlan.where(employee_id: employee_id, from_date: from_date..to_date).order("id DESC")
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('employee_id = ? AND plan_reason_master_id IS ? AND start_latitude IS NOT NULL', employee_id, nil).where(from_date: from_date..to_date).order("id DESC")
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ?', nil).where(employee_id: employee_id).where(from_date: from_date..to_date).order("id DESC")
      elsif status.present? && status != "All" && status != "Attend" && status != "Not Attend"
        employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: status ).where(from_date: from_date..to_date).order("id DESC")
      else
        employee_plan = EmployeePlan.where(employee_id: employee_id).where(from_date: from_date..to_date).order("id DESC")
      end
    elsif manager_id.present? && employee_id.present?
      if status == "All"
        employee_plan = EmployeePlan.where(employee_id: employee_id).where(from_date: from_date..to_date).order("id DESC")
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('employee_id = ? AND plan_reason_master_id IS ?', employee_id, nil).where(from_date: from_date..to_date).order("id DESC")
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ?', nil).where(employee_id: employee_id).where(from_date: from_date..to_date).order("id DESC")
      elsif status.present? && status != "All" && status != "Attend" && status != "Not Attend"
        employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: status ).where(from_date: from_date..to_date).order("id DESC")
      else
        employee_plan = EmployeePlan.where(employee_id: employee_id).where(from_date: from_date..to_date).order("id DESC")
      end
    else manager_id.present? && employee_id.empty?
      if status == "All"
        employee_plan = EmployeePlan.where(from_date: from_date..to_date).where(manager_id: manager_id).order("id DESC")
      elsif status == "Attend"
        employee_plan = EmployeePlan.where('plan_reason_master_id IS ?', nil).where(from_date: from_date..to_date).where(manager_id: manager_id).order("id DESC")
      elsif status == "Not Attend"
        employee_plan = EmployeePlan.where.not('plan_reason_master_id IS ?', nil).where(from_date: from_date..to_date).where(manager_id: manager_id).order("id DESC")
      elsif status.present? && status != "All" && status != "Attend" && status != "Not Attend"
        employee_plan = EmployeePlan.where(current_status: status ).where(from_date: from_date..to_date).where(manager_id: manager_id).order("id DESC")
      else
        employee_plan = EmployeePlan.where(from_date: from_date..to_date).where(manager_id: manager_id).order("id DESC")
      end
    end
    if employee_plan.present?
      render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time.utc.strftime("%H:%M"), :to_time => epl.to_time.utc.strftime("%H:%M"), :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :confirm => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id, :plan_reason_master_id => epl.plan_reason_master.try(:name), :feedback => epl.feedback, :plan_or_unplan => epl.plan_or_unplan, :start_latitude => epl.start_latitude, :end_latitude => epl.end_latitude, :start_time  =>  epl.start_time, :end_time => epl.end_time,:created_latitude => epl.created_latitude, :start_longitude => epl.start_longitude, :end_longitude => epl.end_longitude, :created_longitude => epl.created_longitude, :start_place => epl.start_place, :end_place => epl.start_place, :created_place => epl.created_place, :listed_company_id => epl.listed_company_id }} : []
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
    confirm = params[:confirm]
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
          updated_plan = @update_employee_plan.update(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: current_status, manager_id: manager_id)
          render :status=>200, :json=>{:status=>"Employee plan was successfully updated."}
        end
      else
        @update_employee_plan = EmployeePlan.find(plan_id)
        updated_plan = @update_employee_plan.update(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, latitude: latitude, longitude: longitude, confirm: confirm, status: status, current_status: current_status, manager_id: manager_id)
        render :status=>200, :json=>{:status=>"Employee plan was successfully updated."}
      end    
    else
      render :status=>200, :json=>{:status=>"Employee Plan is not Found."}
    end
  end

  def meeting_plan_approve
    confirm = params[:confirm]
    status = params[:status]
    current_status = params[:current_status]
    plan_id = params[:plan_id]
    @employee_plan = EmployeePlan.find(plan_id)
    plan_approval = @employee_plan.update(current_status: current_status, status: status, confirm: confirm)
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
    employee_attendances = EmployeeAttendance.where(employee_id: employee_id).where.not(holiday_id: nil).order("day ASC")
    render :json => employee_attendances.present? ? employee_attendances.collect{|eat| {:id => eat.id, :employee_id => eat.employee_id, :day => eat.day, :present => eat.present, :in_time => eat.in_time, :out_time => eat.out_time, :machine_attendance_id => eat.machine_attendance_id, :is_confirm => eat.is_confirm, :department_id => eat.department_id, :count => eat.count, :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :company_time_master_id => eat.company_time_master_id, :working_hrs => eat.working_hrs, :rest_time => eat.rest_time, :holiday_id => eat.holiday.name }} : []
  end

  def employee_contact_library
    employees = Employee.where(status: "Active")
    render :json => employees.present? ? employees.collect{|emp| {:id => emp.id, :manual_employee_code => emp.manual_employee_code, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no }} : []
  end
 
  def employee_details
    employee_id = params[:employee_id]
    employee = Employee.where(id: employee_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.try(:name), :employee_designation => emp.joining_detail.employee_designation.try(:name)  }} : []
  end

  def approve_plan_list
    employee_id = params[:employee_id].to_i
    employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: employee_id).order("id DESC")
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id, :prefix => epl.employee.prefix, :employee_first_name => epl.employee.first_name, :employee_middle_name => epl.employee.middle_name, :employee_last_name => epl.employee.last_name, :from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time.utc.strftime("%H:%M"), :to_time => epl.to_time.utc.strftime("%H:%M"), :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :conform => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id  }} : []
  end

  def manager_approve_plan_list
    employee_id = params[:employee_id].to_i
    employee_plan = EmployeePlan.where(current_status: "Approved", manager_id: employee_id)
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id, :prefix => epl.employee.prefix, :employee_first_name => epl.employee.first_name, :employee_middle_name => epl.employee.middle_name, :employee_last_name => epl.employee.last_name, :from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :latitude => epl.latitude, :longitude => epl.longitude, :confirm => epl.confirm, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id  }} : []
  end

  def manager1_employee_list
    manager_id = params[:employee_id]
    employee = Employee.where('manager_id = ?', manager_id).order("manual_employee_code ASC")
    # @employee_plan = EmployeePlan.where(current_status: "Pending", manager_id: manager_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :manual_employee_code => emp.manual_employee_code, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.try(:name), :employee_designation => emp.joining_detail.try(:employee_designation).try(:name)  }} : []
  end

  def manager2_employee_list
    manager_id = params[:employee_id]
    employee = Employee.where('manager_2_id = ?', manager_id)
    render :json => employee.present? ? employee.collect{|emp| {:id => emp.id, :prefix => emp.prefix, :employee_first_name => emp.first_name, :employee_middle_name => emp.middle_name, :employee_last_name => emp.last_name, :contact_no => emp.contact_no, :email => emp.email, :department_id => emp.department.try(:name), :employee_designation => emp.joining_detail.try(:employee_designation).try(:name)  }} : []
  end

  def contact_details
    contact_details = ContactDetail.where(status: true)
    render :json => contact_details.present? ? contact_details.collect{|cd| {:id => cd.id, :employee_id => cd.employee_id, :passport_photo_file_name => cd.employee.try(:passport_photo_file_name), :prefix => cd.employee.try(:prefix), :employee_first_name => cd.employee.try(:first_name), :employee_middle_name => cd.employee.try(:middle_name), :employee_last_name => cd.employee.try(:last_name), :contact_no => cd.employee.try(:contact_no), :email => cd.employee.try(:email), :current_role => cd.employee.try(:joining_detail).try(:employee_designation).try(:name), :description => cd.description, :status => cd.status, :role1 => cd.role1, :role2 => cd.role2, :role3 => cd.role3, :role4 => cd.role4, :role5 => cd.role5, :role6 => cd.role6, :role7 => cd.role7,:role8 => cd.role8  }} : []
  end

  def all_employee_list
    emp_name = Employee.all.order("manual_employee_code ASC")
    render :json => emp_name.present? ? emp_name.collect{|emp| {:id => emp.id, :manual_employee_code => emp.manual_employee_code, :prefix => emp.prefix, :first_name => emp.first_name, :middle_name => emp.middle_name, :last_name => emp.last_name, :contact_no => emp.contact_no}} : []
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
    render :json => employeeplan.present? ? employeeplan.collect{|emppl| {:id => emppl.id, :employee_id => emppl.employee_id, :prefix => emppl.employee.try(:prefix), :employee_first_name => emppl.employee.try(:first_name), :employee_middle_name => emppl.employee.try(:middle_name), :employee_last_name => emppl.employee.try(:last_name), :from_date => emppl.from_date, :to_date => emppl.to_date, :from_time => emppl.from_time, :to_time => emppl.to_time,:meeting_with => emppl.meeting_with,:location => emppl.location,:meeting_agenda => emppl.meeting_agenda,:confirm => emppl.confirm,:status => emppl.status,:current_status => emppl.current_status,:manager_id => emppl.manager_id,:latitude => emppl.latitude,:longitude => emppl.longitude}} : []
  end

  def all_aprove_plan_list
    employeeplan = EmployeePlan.where(current_status: "Pending").order("id DESC")
    render :json => employeeplan.present? ? employeeplan.collect{|emppl| {:id => emppl.id, :employee_id => emppl.employee_id, :prefix => emppl.employee.try(:prefix), :employee_first_name => emppl.employee.try(:first_name), :employee_middle_name => emppl.employee.try(:middle_name), :employee_last_name => emppl.employee.try(:last_name),:from_date => emppl.from_date, :to_date => emppl.to_date, :from_time => emppl.from_time.utc.strftime("%H:%M"), :to_time => emppl.to_time.utc.strftime("%H:%M"),:meeting_with => emppl.meeting_with,:location => emppl.location,:meeting_agenda => emppl.meeting_agenda,:conform => emppl.confirm,:status => emppl.status,:current_status => emppl.current_status,:manager_id => emppl.manager_id,:latitude => emppl.latitude,:longitude => emppl.longitude, :plan_reason_master_id => emppl.plan_reason_master_id, :feedback => emppl.feedback}} : []
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
    payroll_period = PayrollPeriod.where(status: true).take 
    if @on_duty_request.is_available?
      status = "Your Request already has been sent"
    elsif @on_duty_request.end_date == nil 
      status = "please Fill all mendatory fields"
    elsif @on_duty_request.is_salary_processed?
      status = "Salary Processed for this month"
    else
      if @employee.manager_id.nil?
        status = 'Reporting manager not set please set Reporting Manager' 
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
        @on_duty_request.create_attendance_od
        OdStatusRecord.create(employee_id: @employee.id,on_duty_request_id: @on_duty_request.id,status: 'Pending',change_date: Date.today)
        if @employee.manager.email.nil? or @employee.manager.email == ""
          status = "Send request without email."
        else
          status = 'OD Request sent successfully.'
          # OdRequestMailer.pending(@on_duty_request).deliver_now
        end
        if @on_duty_request.id != nil
          if @on_duty_request.leave_type == 'Full/Half'
            if @on_duty_request.first_half == false && @on_duty_request.last_half == false
              @on_duty_request.update(first_half: false,last_half: true)
            end
          end
        end
        @od_record = OdRecord.where(on_duty_request_id: @on_duty_request.id).count
        #@on_duty_request.update(no_of_day: @od_record)
        status = "Request Created Successfully"
      end #manager_id nil
    end #is_available
    if status.empty?
      render :status=>200, :json=>{:status=> "Success"}
    else
      render :status=>200, :json=>{:status=> status}
    end
  end

  def list_of_faq
    frequest_questions = FrequestQuestion.where(status: true)
    # render :json => frequest_questions.present? ? frequest_questions.collect{|faq| { :id => faq.id, :code => faq.code, :question => faq.question, :answer => faq.answer, :employee_id => faq.employee_id, :status => faq.status }} : []
        render :json => frequest_questions.present? ? frequest_questions.collect{|faq| { :id => faq.try(:id), :code => faq.try(:code), :question => faq.try(:question), :answer => faq.try(:answer), :employee_id => faq.try(:employee_id), :status => faq.try(:status) }} : []
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
    render :json => employee_resignations.present? ? employee_resignations.collect{|er| { :id => er.id, :manual_employee_code => er.try(:employee).try(:manual_employee_code), :prefix => er.try(:employee).try(:prefix), :employee_first_name => er.try(:employee).try(:first_name), :employee_middle_name => er.try(:employee).try(:middle_name), :employee_last_name => er.try(:employee).try(:last_name), :employee_id => er.employee_id, :resignation_date => er.resignation_date, :reason => er.reason, :notice_period => er.notice_period, :is_notice_period => er.is_notice_period, :short_notice_period => er.short_notice_period, :tentative_leaving_date => er.tentative_leaving_date, :remark => er.remark, :exit_interview_date => er.exit_interview_date, :note => er.note, :leaving_date => er.leaving_date, :settled_on => er.settled_on, :has_left => er.has_left, :notice_served => er.notice_served, :rehired => er.rehired, :resign_status => er.resign_status, :leaving_reason_id => er.leaving_reason.try(:name), :is_stop_pay_request => er.is_stop_pay_request, :second_reporter_id => er.second_reporter_id, :final_reporter_id => er.final_reporter_id, :is_pending => er.is_pending, :is_first_approved => er.is_first_approved, :is_second_approved => er.is_second_approved, :is_final_approved => er.is_final_approved, :is_cancelled => er.is_cancelled, :is_first_rejected => er.is_first_rejected, :is_second_rejected => er.is_second_rejected, :is_final_rejected => er.is_final_rejected, :application_date => er.application_date, :reporting_master_id => er.reporting_master_id }} : []
  end

  def resignation_status_records
    employee_resignation = params[:employee_resignation_id]
    resignation_status_records = ResignationStatusRecord.where(employee_resignation_id: employee_resignation)
    render :json => resignation_status_records.present? ? resignation_status_records.collect{|rsr| { :id => rsr.id, :employee_resignation => rsr.employee_resignation_id, :change_status_employee_id => rsr.change_status_employee_id, :status => rsr.status, :change_date => rsr.change_date }} : []
  end

  def employee_feedback
    employee_plan_id = params[:plan_id]
    feedback = params[:feedback]
    emp_plan = EmployeePlan.find(employee_plan_id)
    emp_feedback = emp_plan.update(feedback: feedback)
    render :status=>200, :json=>{:status=>"Employee Feedback Successfully Updated."}
  end

  def employee_reason
    reason_id = params[:reason_catagory]
    employee_plan_id = params[:plan_id]
    feedback = params[:reason]
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
    emp_id = params[:employee_id]
    date = params[:date].to_date
    month_nm = date.to_date.strftime("%B")
    in_time = params[:in_time].to_time
    #in_time = in_t + 330.minutes
    latitude = params[:latitude]
    longitude = params[:longitude]
    place = params[:place]
    emp = Employee.find(emp_id)
    emp_first = emp.first_name
    emp_last = emp.last_name
    space = " "
    emp_name = emp_first + space + emp_last
    emp_code = emp.manual_employee_code

    DailyAttendance.create(employee_code: emp_code, date: date, time: in_time, latitude: latitude, longitude: longitude, place: place, comment: "App Wise Updated")
    emp_att = EmployeeAttendance.where(employee_id: emp_id, day: date)
    if emp_att.present?
      time = emp_att.where(employee_id: emp_id).where.not(in_time: nil)
      if time.present?
        emp_att_time = emp_att.update_all(out_time: in_time.to_time)
      else
        emp_att_time = emp_att.update_all(in_time: in_time.to_time)
      end
    else
      emp_att_time = EmployeeAttendance.create(employee_id: emp_id, employee_code: emp_code, day: date, present: "P", in_time: in_time.to_time, month_name: month_nm, employee_name: emp_name)
    end
    emp_att_l = EmployeeAttendance.where(employee_id: emp_id, day: date)
    emp_att_last = emp_att_l.last
    if emp_att_l.last.working_hrs.present?
      in_time = emp_att_last.in_time.to_time
      out_time = emp_att_last.out_time.to_time
      total_hrms = out_time - in_time
      working_hrs = Time.at(total_hrms).utc.strftime("%H:%M")
      if working_hrs > "07:00"
        emp_att_l.update_all(working_hrs: working_hrs, present: "P")
      else
        emp_att_l.update_all(working_hrs: working_hrs, present: "HD")
      end
    else
      if emp_att_l.last.out_time.present?
        in_time = emp_att_last.in_time.to_time
        out_time = emp_att_last.out_time.to_time
        total_hrms = out_time - in_time
        working_hrs = Time.at(total_hrms).utc.strftime("%H:%M")
        if working_hrs > "07:00"
          emp_att_l.update_all(working_hrs: working_hrs, present: "P")
        else
          emp_att_l.update_all(working_hrs: working_hrs, present: "HD")
        end
      else
        emp_att_l.update_all(present: "HD")
      end
    end
    render :status=>200, :json=>{:status=>"Attendance Successfully Stored."}
  end

  def employee_daily_attendance
    employee_id = params[:employee_id]
    emp = Employee.find(employee_id)
    emp_code = emp.manual_employee_code
    date = params[:date]
    emp_daily_att = DailyAttendance.where(employee_code: emp_code, date: date).order("id DESC")
    render :json => emp_daily_att.present? ? emp_daily_att.collect{|eda| { :id => eda.id, :date => eda.date, :time => eda.time.strftime("%I:%M %p"), :employee_code => eda.employee_code, :latitude => eda.latitude, :longitude => eda.longitude, :place => eda.place, :note => eda.comment }} : []
  end

  def admin_all_leave_request_list
    first_level_request_lists = EmployeeLeavRequest.where("current_status = ? OR current_status = ?", "Pending", "FirstApproved").order("id DESC")
    # @emp_leav_req = EmployeeLeavRequest.where.not(second_reporter_id: false).pluck(:second_reporter_id)
    # @second_level_request_lists = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,second_reporter_id: @emp_leav_req)
    render :json => first_level_request_lists.present? ? first_level_request_lists.collect{|adminlr| { :id => adminlr.id, :employee_id => adminlr.employee_id, :prefix => adminlr.employee.prefix, :employee_first_name => adminlr.employee.first_name, :employee_middle_name => adminlr.employee.middle_name, :employee_last_name => adminlr.employee.last_name, :leav_category_id => adminlr.leav_category_id, :leave_type => adminlr.leave_type, :first_reporter_id => adminlr.first_reporter_id, :second_reporter_id => adminlr.second_reporter_id, :manual_employee_code => adminlr.employee.manual_employee_code, :leav_category => adminlr.leav_category.name, :leave_count => adminlr.leave_count, :start_date => adminlr.start_date, :end_date => adminlr.end_date, :current_status => adminlr.current_status, :reason => adminlr.reason }} : []
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
    time = params[:time]
    date = params[:date]
    lon = params[:latitude].to_f
    lat = params[:longitude].to_f
    longitude = lon.round(4)
    latitude = lat.round(4)
    location = params[:place]
    emp_history = EmployeeLocationHistory.where(employee_id: emp_id, date: date)
    emp_last_history = EmployeeLocationHistory.where(employee_id: emp_id, date: date).last
    emp_count = emp_history.count
    if emp_count >= 2
      last_lat = emp_last_history.latitude
      last_lon = emp_last_history.longitude
      if latitude == last_lat && longitude == last_lon
        emp_last_history.update(employee_id: emp_id, date: date, time: time, latitude: latitude, longitude: longitude, location: location)
        render :status=>200, :json=>{:status=>"Employee Attendance Successfully updated."}
      elsif location == emp_last_history.location
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
    emp_id = params[:employee_id]
    date = params[:date]
    date_wise_history = EmployeeLocationHistory.where(employee_id: emp_id, date: date).order("id DESC")
    render :json => date_wise_history.present? ? date_wise_history.collect{|dwh| { :employee_id => dwh.employee_id, :date => dwh.date, :time => dwh.time.strftime("%I:%M:%S %p"),:latitude => dwh.latitude, :longitude => dwh.longitude, :location => dwh.location }} : []
  end

  def company_logo
    company_details = Company.first
    render :status=>200, :json=>{:company_name => company_details.name, :company_logo => company_details.company_logo.url }
  end

  def admin_od_request_approval_list
    pending_on_duty_requests = OnDutyRequest.where(current_status: "Pending").order("id DESC")
    # first_approved_on_duty_requests = OnDutyRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false,employee_id: employees_ind)  
    render :json => pending_on_duty_requests.present? ? pending_on_duty_requests.collect{|odral| { :id => odral.id, :employee_id => odral.employee_id, :manual_employee_code => odral.employee.manual_employee_code, :prefix => odral.employee.prefix, :employee_first_name => odral.employee.first_name, :employee_middle_name => odral.employee.middle_name, :employee_last_name => odral.employee.last_name, :leave_type => odral.leave_type, :start_date => odral.start_date, :end_date => odral.end_date, :no_of_day => odral.no_of_day, :first_half => odral.first_half, :last_half => odral.last_half, :present_status => odral.present_status, :first_reporter_id => odral.first_reporter_id, :second_reporter_id => odral.second_reporter_id, :current_status => odral.current_status, :is_pending => odral.is_pending, :is_cancelled => odral.is_cancelled, :is_first_approved => odral.is_first_approved, :is_second_approved => odral.is_second_approved, :is_first_rejected => odral.is_first_rejected, :is_second_rejected => odral.is_second_rejected }} : []
  end

  def current_location_particular_emp
    date = params[:date].to_date
    emp_id = params[:employee_id]
    if date.present?
      elh = EmployeeLocationHistory.where(employee_id: emp_id, date: date.to_date)
    else
      elh = EmployeeLocationHistory.where(employee_id: emp_id, date: Time.now.to_date)
    end
    render :json => elh.present? ? elh.collect{|elh| { :id => elh.id, :employee_id => elh.employee_id, :date => elh.date, :time => elh.time.strftime("%I:%M %p"), :latitude => elh.latitude, :longitude => elh.longitude, :location => elh.location }} : []
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
    render :status=>200, :json=>{:status=>"Created Successfully."}
  end

  def emp_activity
    employee_id = params[:employee_id]
    emp_activity = EmployeeDailyActivity.where(employee_id: employee_id)
    render :json => emp_activity.present? ? emp_activity.collect{|emp| { :employee_id => emp.employee_id, :project_master_id => emp.project_master_id, :today_activity => emp.today_activity, :tomorrow_plan => tomorrow_plan, :day => day }} : []
  end

  def emp_details_salary_slip
    employee_id = params[:employee_id]
    emp_details = Employee.where(id: employee_id)
    render :json => emp_details.present? ? emp_details.collect{|e| {:id => e.id, :passport_photo_file_name => e.passport_photo_file_name, :manual_employee_code => e.manual_employee_code, :prefix => e.prefix, :first_name => e.first_name, :middle_name => e.middle_name, :last_name => e.last_name, :date_of_birth => e.date_of_birth, :gender => e.gender,:contact_no => e.contact_no,:email => e.email,:permanent_address => e.company_location.try(:address),:country_id => e.country_id,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:blood_group_id => e.blood_group.try(:name), :employee_type_id => e.employee_type.try(:name),:nationality_id => e.nationality.try(:name),:company_id => e.company.try(:name),:department_id => e.department.try(:name),:sub_department_id => e.sub_department.try(:name), :employee_designation => e.joining_detail.employee_designation.try(:name), :employee_uan_no => e.joining_detail.employee_uan_no, :account_no => e.try(:employee_bank_detail).try(:account_no), :employee_pf_no => e.try(:joining_detail).try(:employee_pf_no), :company_location => e.try(:company_location).try(:name) }} : []
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
    render :json => addable_salary_components.present? ? addable_salary_components.collect{|sal| { :id => sal.id, :salaryslip_id => sal.salaryslip_id, :salary_component_id => sal.salary_component.try(:name), :actual_amount => sal.actual_amount, :is_deducted => sal.is_deducted, :other_component_name => sal.other_component_name, :calculated_amount => sal.calculated_amount, :employee_template_id => sal.employee_template_id, :is_arrear => sal.is_arrear }} : []
  end

  def emp_deducted_salary_details
    salaryslip_id = params[:salaryslip_id]
    deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, salaryslip_id)
    render :json => deducted_salary_components.present? ? deducted_salary_components.collect{|sal| { :id => sal.id, :salaryslip_id => sal.salaryslip_id, :salary_component_id => sal.salary_component.try(:name), :actual_amount => sal.actual_amount, :is_deducted => sal.is_deducted, :other_component_name => sal.other_component_name, :calculated_amount => sal.calculated_amount, :employee_template_id => sal.employee_template_id, :is_arrear => sal.is_arrear }} : []
  end

  def emp_daily_activity_list
    employee = params[:employee_id]
    emp_daily_list = EmployeeDailyActivity.where(employee_id: employee).order("id DESC")
    render :json => emp_daily_list.present? ? emp_daily_list.collect{|sal| { :id => sal.id, :employee_id => sal.employee_id, :prefix => sal.employee.try(:prefix), :first_name => sal.employee.try(:first_name), :middle_name => sal.employee.try(:middle_name), :last_name => sal.employee.try(:last_name), :manager_id => sal.employee.try(:manager_id), :project_master_id => sal.try(:project_master).try(:name), :today_activity => sal.today_activity, :tomorrow_plan => sal.tomorrow_plan, :day => sal.day }} : []
  end

  def employee_wise_attendance
    emp_id = params[:employee_id]
    time_now = Time.now.to_date
    time_ago = Time.now.to_date - 30.days
    emp_att = EmployeeAttendance.where(employee_id: emp_id, day: time_ago..time_now).order("day DESC")
    if emp_att.present?
      # render :json => emp_att.present? ? emp_att.collect{|emp_att| { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).try(:strftime("%I:%M:%S %p")), :out_time => emp_att.try(:out_time).try(:strftime("%I:%M:%S %p")), :working_hrs => emp_att.working_hrs, :present => emp_att.present }} : []
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time).strftime("%I:%M %p"), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        else
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  def employee_wise_date
    emp_id = params[:employee_id]
    start_date = params[:start_date]
    end_date = params[:end_date]
    emp_att = EmployeeAttendance.where(employee_id: emp_id, day: start_date..end_date).order("day DESC")
    if emp_att.present?
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time).strftime("%I:%M %p"), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        else
          { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  def notes_details
    daily_att_id = params[:id]
    note = params[:notes]
    daily_att = DailyAttendance.find(daily_att_id)
    if daily_att.present?
      daily_att.update(comment: note)
      render :status=>200, :json=>{:status=>"Note Successfully Update"}
    else  
      render :status=>200, :json=>{:status=>"DailyAttendance Not Found "}
    end
  end

  def listed_company
    all_company = ListedCompany.all
    render :json => all_company.present? ? all_company.collect{|comp| { :id => comp.try(:id), :name => comp.try(:name), :contact_no => comp.try(:contact_no), :email => comp.try(:email) }} : []
  end

  def start_meeting
    plan_id = params[:plan_id]
    start_latitude = params[:latitude]
    start_longitude = params[:longitude]
    start_place = params[:place]
    start_date = params[:meeting_date]
    start_time = params[:meeting_time]
    emp_plan =  EmployeePlan.where(id: plan_id)
    emp_plan.update_all(start_latitude: start_latitude,start_longitude: start_longitude, start_place: start_place, start_date: start_date, start_time: start_time)
    render :status=>200, :json=>{:status=>"Meeting Started"}
  end

  def end_meeting
    plan_id = params[:plan_id]
    end_latitude = params[:latitude]
    end_longitude = params[:longitude]
    end_place = params[:place]
    end_date = params[:meeting_date]
    end_time = params[:meeting_time]
    emp_plan =  EmployeePlan.where(id: plan_id)
    emp_plan.update_all(end_latitude: end_latitude, end_longitude: end_longitude, end_place: end_place, end_date: end_date, end_time: end_time) 
    render :status=>200, :json=>{:status=>"Meeting End"}
  end

  def meeting_minutes
    plan_id = params[:plan_id]
    minute = params[:notes]
    MeetingMinute.create(employee_plan_id: plan_id, minutes: minute)
    plan_minutes = MeetingMinute.where(employee_plan_id: plan_id)
    render :json => plan_minutes.present? ? plan_minutes.collect{|minutes| { :id => minutes.try(:id), :minutes => minutes.try(:minutes) }} : []
  end

  def meeting_plan_minutes
    plan_id = params[:plan_id]
    meeting_mintes = MeetingMinute.where(employee_plan_id: plan_id)
    render :json => meeting_mintes.present? ? meeting_mintes.collect{|minutes| { :id => minutes.try(:id), :minutes => minutes.try(:minutes) }} : []
  end

  def notifications_count
    employee_id = params[:employee_id]
    keyword = params[:keyword]
    @joining_detail = JoiningDetail.find_by(employee_id: employee_id)
    @gps_track = @joining_detail.try(:gps_track)
    @restricted_area = @joining_detail.try(:restricted_area)
    if keyword == "employee"
      self_pending_od = OnDutyRequest.where(current_status: "Pending", employee_id: employee_id).count
      self_pending_leave  = EmployeeLeavRequest.where(current_status: "Pending", employee_id: employee_id).count
      leave_c_off = LeaveCOff.where(employee_id: employee_id, current_status: "Pending").count
      employee_plan = EmployeePlan.where(employee_id: employee_id, current_status: "Pending").count
      travel_requests = TravelRequest.where(employee_id: employee_id, current_status: "Pending").count
      expense_claim = TravelRequest.where(employee_id: employee_id, current_status: "FinalApproved", is_confirm: nil).count
      render :status=>200, :json=>{:self_pending_od => self_pending_od, :self_pending_leave => self_pending_leave, :gps_track => @gps_track, :restricted_area => @restricted_area, :leave_c_off => leave_c_off, :employee_plan => employee_plan, :travel_requests => travel_requests, :expense_claim => expense_claim }
    elsif keyword == "manager"
      emp = Employee.find(employee_id)
      od_employees = emp.subordinates
      employees_ind = emp.indirect_subordinates
      @emps = od_employees + employees_ind
      pending_od = OnDutyRequest.where(current_status: "Pending", employee_id: od_employees).count
      pending_leave  = EmployeeLeavRequest.where(current_status: "Pending", first_reporter_id: employee_id).count
      @employees = Employee.where(manager_id: employee_id).pluck(:id)
      leave_c_off = LeaveCOff.where(employee_id: @emps, is_taken: false,status: false,is_expire: false,current_status: "Pending").count
      employee_plan = EmployeePlan.where(manager_id: employee_id, current_status: "Pending").count
      travel_requests = TravelRequest.where(reporting_master_id: employee_id, current_status: "Pending").count
      expense_claim = TravelRequest.where(reporting_master_id: employee_id, current_status: "FinalApproved", is_confirm: true).count
      employee_resignation = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false,reporting_master_id: employee_id).count
      render :status=>200, :json=>{:employee_resignation => employee_resignation, :pending_leave => pending_leave, :pending_od => pending_od, :gps_track => @gps_track, :restricted_area => @restricted_area, :leave_c_off => leave_c_off, :employee_plan => employee_plan, :travel_requests => travel_requests, :expense_claim => expense_claim }
    else keyword == "admin"
      all_pending_od = OnDutyRequest.where(current_status: "Pending").count
      all_pending_leave  = EmployeeLeavRequest.where(current_status: "Pending").count
      leave_c_off = LeaveCOff.where(is_taken: false,status: false,is_expire: false,current_status: "Pending").count
      employee_plan = EmployeePlan.where(current_status: "Pending").count
      travel_requests = TravelRequest.where(current_status: "Pending").count
      expense_claim = TravelRequest.where(current_status: "FinalApproved").count
      final_travel_requests = TravelRequest.where(current_status: "Approved").count
      employee_resignations = EmployeeResignation.where(resign_status: "SecondApproved").count
      render :status=>200, :json=>{:employee_resignations => employee_resignations, :all_pending_leave => all_pending_leave, :all_pending_od => all_pending_od, :gps_track => @gps_track, :restricted_area => @restricted_area,:leave_c_off => leave_c_off, :employee_plan => employee_plan, :travel_requests => travel_requests, :expense_claim => expense_claim, :final_travel_requests => final_travel_requests }
    end
  end

  def holiday_setup_manager
    employee_id = params[:employee_id]
    from_date = params[:from_date]
    to_date = params[:to_date]
    if from_date.present? and to_date.present? and employee_id.present?
      @employee_attendances = EmployeeAttendance.where(employee_id: employee_id, day: from_date..to_date).where.not(holiday_id: nil).order("day ASC")
    else !from_date.present? and !to_date.present? and employee_id.present?
      @employee_wise_attendancettendances = EmployeeAttendance.where(employee_id: employee_id).where.not(holiday_id: nil).order("day ASC")
    end
    render :json => @employee_attendances.present? ? @employee_attendances.collect{|eat| {:id => eat.id, :employee_id => eat.employee_id, :holiday_date => eat.day, :present => eat.try(:present), :in_time => eat.in_time, :out_time => eat.out_time, :machine_attendance_id => eat.machine_attendance_id, :is_confirm => eat.is_confirm, :department_id => eat.department_id, :count => eat.count, :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :company_time_master_id => eat.company_time_master_id, :working_hrs => eat.working_hrs, :rest_time => eat.rest_time, :name => eat.try(:holiday).name, :day => eat.try(:day).strftime("%A")}} : []
  end

  def manager_wise_emp_list
    @employee_id = params[:employee_id]
    employees = Employee.where(manager_id: @employee_id).order("manual_employee_code ASC")
    render :json => employees.present? ? employees.collect{|e| {:id => e.id,:passport_photo_file_name => e.passport_photo_file_name,:manual_employee_code => e.manual_employee_code,:employee_first_name => e.first_name,:employee_middle_name => e.middle_name,:employee_last_name => e.last_name,:date_of_birth => e.date_of_birth,:gender => e.gender,:contact_no => e.contact_no,:optinal_contact_no => e.optinal_contact_no,:optinal_contact_no1 => e.optinal_contact_no1,:email => e.email,:optional_email => e.optional_email,:permanent_address => e.permanent_address,:country_id => e.country_id,:state_id => e.state.try(:name),:district_id => e.district.try(:name),:city => e.city,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:licence_no => e.licence_no,:marital_status => e.marital_status,:blood_group_id => e.blood_group.try(:name),:employee_type_id => e.employee_type.try(:name),:nationality_id => e.nationality.try(:name),:religion_id => e.religion.try(:name),:handicap => e.handicap,:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.company.try(:name),:company_location_id => e.company_location.try(:name),:department_id => e.department.try(:name),:sub_department_id => e.sub_department.try(:name), :emergency_contact_no => e.emergency_contact_no, :employee_designation => e.try(:joining_detail).try(:employee_designation).try(:name), :employee_uan_no => e.try(:joining_detail).try(:employee_uan_no) }} : []
  end
  
  def admin_wise_emp_list
    employees = Employee.all.order("manual_employee_code ASC")
    render :json => employees.present? ? employees.collect{|e| {:id => e.id, :employee_id => e.id, :passport_photo_file_name => e.passport_photo_file_name,:manual_employee_code => e.manual_employee_code,:employee_first_name => e.first_name,:employee_middle_name => e.middle_name,:employee_last_name => e.last_name,:date_of_birth => e.date_of_birth,:gender => e.gender,:contact_no => e.contact_no,:optinal_contact_no => e.optinal_contact_no,:optinal_contact_no1 => e.optinal_contact_no1,:email => e.email,:optional_email => e.optional_email,:permanent_address => e.permanent_address,:country_id => e.country_id,:state_id => e.state.try(:name),:district_id => e.district.try(:name),:city => e.city,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:licence_no => e.licence_no,:marital_status => e.marital_status,:blood_group_id => e.blood_group.try(:name),:employee_type_id => e.employee_type.try(:name),:nationality_id => e.nationality.try(:name),:religion_id => e.religion.try(:name),:handicap => e.handicap,:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.company.try(:name),:company_location_id => e.company_location.try(:name),:department_id => e.department.try(:name),:sub_department_id => e.sub_department.try(:name), :emergency_contact_no => e.emergency_contact_no, :employee_designation => e.try(:joining_detail).try(:employee_designation).try(:name), :employee_uan_no => e.try(:joining_detail).try(:employee_uan_no) }} : []
  end

  def manager_wise_att
    manager_id = params[:employee_id]
    time_now = Time.now.to_date
    @employees = Employee.where(manager_id: manager_id).pluck(:id)
    emp_att = EmployeeAttendance.where(employee_id: @employees, day: time_now).order("day DESC")
    if emp_att.present?
      # render :json => emp_att.present? ? emp_att.collect{|emp_att| { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).try(:strftime("%I:%M:%S %p")), :out_time => emp_att.try(:out_time).try(:strftime("%I:%M:%S %p")), :working_hrs => emp_att.working_hrs, :present => emp_att.present }} : []
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time).strftime("%I:%M %p"), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        else
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :day => emp_att.day, :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  def manager_attendance_list
    manager_id = params[:manager_id]
    employee_id = params[:employee_id]
    from_date = params[:from_date]
    to_date = params[:to_date]
    time_now = Time.now.to_date 
    @employees = Employee.where(manager_id: manager_id).pluck(:id)
    if manager_id.present? and from_date.present? and employee_id.present?
      employee_attendances = EmployeeAttendance.where(employee_id: employee_id, day: from_date.to_date..to_date.to_date).order("day DESC")
    elsif manager_id.present? and from_date.present? and !employee_id.present?
      employee_attendances = EmployeeAttendance.where(employee_id: @employees, day: from_date.to_date..to_date.to_date).order("day DESC")
    elsif manager_id.present? and !from_date.present? and employee_id.present?
      employee_attendances = EmployeeAttendance.where(employee_id: employee_id).order("day DESC")
    elsif manager_id.present? and !from_date.present? and !employee_id.present?
      employee_attendances = EmployeeAttendance.where(employee_id: @employees, day: time_now).order("day DESC")
    end
    render :json => employee_attendances.present? ? employee_attendances.collect{|eat| 
    if eat.in_time.present? and eat.out_time.present?
      {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time).strftime("%I:%M %p"), :out_time => eat.try(:out_time).strftime("%I:%M %p"), :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }
    elsif eat.in_time.present? and !eat.out_time.present?
      {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time).strftime("%I:%M %p"), :out_time => eat.out_time, :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }
    else
      {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.in_time, :out_time => eat.out_time, :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }
    end
    } : []  
  end

  def admin_att
    time_now = Time.now.to_date
    emp_att = EmployeeAttendance.where(day: time_now).order("day ASC")
    if emp_att.present?
      # render :json => emp_att.present? ? emp_att.collect{|emp_att| { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).try(:strftime("%I:%M:%S %p")), :out_time => emp_att.try(:out_time).try(:strftime("%I:%M:%S %p")), :working_hrs => emp_att.working_hrs, :present => emp_att.present }} : []
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time).strftime("%I:%M %p"), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        else
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  def admin_attendance_list
    employee_id = params[:employee_id]
    from_date = params[:from_date]
    to_date = params[:to_date]
    time_now = Time.now.to_date
    if employee_id.present? and from_date.present?
      employee_attendances = EmployeeAttendance.where(employee_id: employee_id, day: from_date.to_date..to_date.to_date).order("day DESC")
    elsif employee_id.present? and !from_date.present?
      employee_attendances = EmployeeAttendance.where(employee_id: employee_id).order("day DESC")
    elsif !employee_id.present? and from_date.present?
      employee_attendances = EmployeeAttendance.where(day: from_date.to_date..to_date.to_date).order("day DESC")
    else
      employee_attendances = EmployeeAttendance.where(day: time_now).order("day DESC")
    end
    render :json => employee_attendances.present? ? employee_attendances.collect{|eat| 
      if eat.in_time.present? and eat.out_time.present?
        {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time).strftime("%I:%M %p"), :out_time => eat.try(:out_time).strftime("%I:%M %p"), :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }
      elsif eat.in_time.present? and !eat.out_time.present?
        {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time).strftime("%I:%M %p"), :out_time => eat.try(:out_time), :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }      
      else
        {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time), :out_time => eat.try(:out_time), :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }
      end
      } : []  
  end

  def yearly_company_holiday
    today = Date.today
    beginning_of_year = today.beginning_of_year
    end_of_year = today.end_of_year
    holiday = Holiday.where(holiday_date: beginning_of_year..end_of_year)
    render :json => holiday.present? ? holiday.collect{|holi| { :id => holi.try(:id), :code => holi.try(:code), :name => holi.try(:name), :description => holi.try(:description), :holiday_date => holi.try(:holiday_date), :day => holi.try(:holiday_date).strftime("%A"), :holiday_type => holi.try(:holiday_type) }} : []
  end

  def all_employee_details
    plan_id = params[:plan_id]
    emp_att = EmployeeAttendance.where(id: plan_id)
    if emp_att.present?
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
      	  { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        else
	         { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  #def all_employee_details
   # plan_id = params[:plan_id]
   # employee_attendances = EmployeeAttendance.where(id: plan_id)
   # render :json => employee_attendances.present? ? employee_attendances.collect{|eat| {:id => eat.id, :manual_employee_code => eat.try(:employee).try(:manual_employee_code), :employee_id => eat.employee_id, :prefix => eat.try(:employee).try(:prefix), :employee_first_name => eat.try(:employee).try(:first_name), :employee_middle_name => eat.try(:employee).try(:middle_name), :employee_last_name => eat.try(:employee).try(:last_name), :day => eat.day, :present => eat.present, :in_time => eat.try(:in_time).strftime("%I:%M %p"), :out_time => eat.try(:out_time).strftime("%I:%M %p"), :employee_leav_request_id => eat.employee_leav_request_id, :on_duty_request_id => eat.on_duty_request_id, :working_hrs => eat.working_hrs, :comment => eat.comment }} : []
  #end

  def all_emp_leave_details
    leave_id = params[:leave_id]
    leave_list = EmployeeLeavRequest.where(id: leave_id).order("id DESC")
    render :json => leave_list.present? ? leave_list.collect{|ll| { :id => ll.id, :manual_employee_code => ll.try(:employee).try(:manual_employee_code), :employee_id => ll.employee_id, :leav_category_initial => ll.leav_category.try(:code), :leav_category_id => ll.leav_category.try(:name), :leave_type => ll.leave_type, :start_date => ll.start_date, :end_date => ll.end_date, :reason=> ll.reason, :current_status=> ll.current_status, :no_of_day => ll.leave_count, :leave_status_records => ll.leave_status_records }} : []
  end

  def all_emp_od_details
    od_id = params[:od_id]
    on_duty_requests = OnDutyRequest.where(id: od_id).order("id DESC")
    render :json => on_duty_requests.present? ? on_duty_requests.collect{|odr| {:id => odr.id, :manual_employee_code => odr.try(:employee).try(:manual_employee_code), :employee_id => odr.employee_id, :leave_type => odr.leave_type, :start_date => odr.start_date, :end_date => odr.end_date, :no_of_day => odr.no_of_day, :reason => odr.reason, :first_half => odr.first_half, :last_half => odr.last_half,:present_status => odr.present_status,:first_reporter_id => odr.first_reporter_id, :second_reporter_id => odr.second_reporter_id, :current_status => odr.current_status,:is_pending => odr.is_pending,:is_cancelled => odr.is_cancelled,:is_first_approved => odr.is_first_approved,:is_second_approved => odr.is_second_approved,:is_first_rejected => odr.is_first_rejected,:is_second_rejected => odr.is_second_rejected, :status => odr.od_status_records}} : []
  end

  def all_com_off_request_list
    employee_id = params[:employee_id]
    @leave_c_offs = LeaveCOff.where(employee_id: employee_id).order("id DESC")
    render :json => @leave_c_offs.present? ? @leave_c_offs.collect{|coff| {:id => coff.try(:id), :employee_id => coff.try(:employee_id), :c_off_date => coff.try(:c_off_date), :c_off_type => coff.try(:c_off_type),:c_off_expire_day => coff.try(:c_off_expire_day),:expiry_status => coff.try(:expiry_status),:is_taken => coff.try(:is_taken),:expiry_date => coff.try(:expiry_date),:leave_count => coff.try(:leave_count),:is_expire => coff.try(:is_expire),:created_at => coff.try(:created_at),:status => coff.try(:status),:current_status => coff.try(:current_status),:taken_date => coff.try(:taken_date), :comment => coff.try(:comment), :all_status => coff.try(:status_c_offs)  }} : []
  end

  def employee_c_off_request
    status  = ''
    @employee_id = params[:employee_id]
    @c_off_date = params[:selectedDate]
    @c_off_type = "Full Day"
    @comment = params[:comment]
    leav_category = LeavCategory.find_by(code: 'C.Off')
    # if @c_off_type == nil || @c_off_type == ""
    #   @c_off_type = "Full Day"
    # end
    @leave_c_off = LeaveCOff.new
    @joining_detail = JoiningDetail.find_by(employee_id: @employee_id)
    if @joining_detail.c_off == true
      if @leave_c_off.is_self_present(@employee_id, @c_off_date)
        status = "Your COff already set for that day"
      else
        @leave_c_off = LeaveCOff.new(employee_id: @employee_id, c_off_date: @c_off_date, comment: @comment)
        @leave_c_offs = LeaveCOff.all
        @emp_attendance = EmployeeAttendance.where(employee_id: @employee_id,day: @c_off_date.to_date).take
          if leav_category.nil?
          else
            @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
            if @c_off.nil?
            else
              @c_off.each do |l|
                if l.try(:expiry_date).to_date < Date.today
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
                 # @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
                  LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
                 # @employee_leave_balance.save
                else
                  @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take
                  @employee_leave_balance.save
                end
              end#do
            end#c_off.nil?
            #byebug

            if @emp_attendance.try(:holiday_id).try(:present?) || @emp_attendance.try(:employee_week_off_id).try(:present?)
              if @emp_attendance.on_duty_request_id.present?
                @on_duty_request = OnDutyRequest.find_by(id: @emp_attendance.on_duty_request_id)
                if @on_duty_request.leave_type == "Half Day"
                  @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Half Day",c_off_expire_day: 0,expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 0.5,status: false,current_status: "Pending",comment: @comment)
                  StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                  # flash[:notice] = "Your COff Created Successfully!"
                  status = "Your COff already set for that day"
                  COffMailer.pending(@leave_c_off).deliver_now
                else#@on_duty_request.leave_type == "Full Day"
                  @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Full Day",c_off_expire_day: 0,expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 1,status: false,current_status: "Pending",comment: @comment)
                  StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                  status = "Your COff Created Successfully!"
                  COffMailer.pending(@leave_c_off).deliver_now
                end#@on_duty_request.leave_type == "Half Day"
              else#emp_attendance.on_duty_request_id != nil
                if @emp_attendance.working_hrs.to_s < "07:00"
                  if @emp_attendance.working_hrs.to_s < "04:00"
                    status = "Working hours less then 4"
                  else#working_hrs.to_s < "4:00"
                    @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Half Day",
                      c_off_expire_day: 0,expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 0.5,status: false,current_status: "Pending",comment: @comment)
                    StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                    status = "Your COff Created Successfully!"
                    COffMailer.pending(@leave_c_off).deliver_now
                  end#working_hrs.to_s < "4:00"
                else#@emp_attendance.working_hrs.to_s < "7:00"
                  @leave_c_off = LeaveCOff.create(employee_id: @employee_id,c_off_date: @c_off_date,c_off_type: "Full Day",c_off_expire_day: 0,
                    expiry_status: nil,expiry_date: nil,is_expire: false,leave_count: 1,status: false,current_status: "Pending",comment: @comment)
                  StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: @employee_id,status: "Pending")
                  status = "Your COff Created Successfully!"
                  COffMailer.pending(@leave_c_off).deliver_now
                end#@emp_attendance.working_hrs.to_s < "7:00"
              end#@emp_attendance.on_duty_request_id != nil
            else#@emp_attendance.holiday_id != nil
              status = "Holiday Or Week Off not available !"
            end#@emp_attendance.holiday_id != nil

          end#leav_category.nil?
      end#@leave_c_off.is_self_present(@employee_id,@c_off_date)
    else
      status = "You are not applicable for compansatory off!"
    end
    if status.empty?
      render :status=>200, :json=>{:status=> " Successfully "}
    else
      render :status=>200, :json=>{:status=> status}
    end
  end

  def travel_option_list
    travel_option = TravelOption.all
    render :json => travel_option.present? ? travel_option.collect{|trav_option| {:id => trav_option.try(:id), :code => trav_option.try(:code), :name => trav_option.try(:name), :description => trav_option.try(:description),:is_confirm => trav_option.try(:is_confirm) }} : []
  end

  def travel_mode_list
    travel_mode = TravelMode.all
    render :json => travel_mode.present? ? travel_mode.collect{|trav_mode| {:id => trav_mode.try(:id), :code => trav_mode.try(:code), :name => trav_mode.try(:name), :description => trav_mode.try(:description),:is_confirm => trav_mode.try(:is_confirm) }} : []
  end

  def employee_travel_request
    status  = ''
    employee_id = params[:employee_id]
    travel_option = params[:travel_option]
    travel_mode = params[:travel_mode]
    place = params[:place]
    from_date = params[:from_date]
    to_date = params[:to_date]
    total_advance = params[:total_advance]
    tour_purpose = params[:tour_purpose]
    manager1_id = params[:manager1_id]
    manager2_id = params[:manager2_id]
    application_date = Time.zone.now.to_date
    reporting_master_id = ReportingMaster.find_by(employee_id: manager1_id)
    @travel_request = TravelRequest.new(employee_id: employee_id, application_date: application_date, traveling_date: from_date, tour_purpose: tour_purpose, place: place, total_advance: total_advance, travel_option_id: travel_option, travel_mode_id: travel_mode, to: to_date, reporting_master_id: manager1_id)
    emp = Employee.find_by(id: employee_id)
    if reporting_master_id.nil?
      status = "Reporting Manager not set please set Reporting Manager"
    else
      if @travel_request.save
        TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: manager1_id , current_status: "Pending")
        ReportingMastersTravelRequest.create(reporting_master_id: manager1_id, travel_request_id: @travel_request.id,travel_status: "Pending")
        TravelRequestHistory.create(employee_id: employee_id,travel_request_id: @travel_request.id,application_date: application_date, traveling_date: from_date, tour_purpose: tour_purpose, place: place, total_advance: total_advance, reporting_master_id: manager1_id, travel_option_id: travel_option, current_status: @travel_request.current_status)
        @c1 = (@travel_request.to - @travel_request.traveling_date).to_i + 1
        TravelRequest.where(id: @travel_request.id).update_all(day: @c1)
        status = "Travel request was successfully created."
      else
        status = "unprocessable_entity"
      end
    end#emp.try(:manager_id).nil?
    if status.empty?
      render :status=>200, :json=>{:status=> " Successfully "}
    else
      render :status=>200, :json=>{:status=> status}
    end
  end

  def travel_approval_list
    employee_id = params[:employee_id]
    reporting_master_id = ReportingMaster.find_by(employee_id: employee_id)
    travel_requests = TravelRequest.where("reporting_master_id = ? and (current_status = ? or current_status = ? or current_status = ?)",employee_id,"Pending","FirstApproved","Approved & Send Next").order("id ASC") 
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status),:is_confirm => travel_list.try(:is_confirm), :all_status => travel_list.try(:reporting_masters_travel_requests) }} : []
  end

  def cancel_travel_request
    employee_id = params[:employee_id]
    travel_req_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "Cancelled",reporting_master_id: @travel_request.travel_option_id)
    TravelRequestHistory.create(employee_id: employee_id, travel_request_id: travel_req_id ,application_date: @travel_request.application_date, traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id, current_status: "Cancelled")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: employee_id, travel_status: "Cancelled")
    render :status=>200, :json=>{:status=> "Travel Request Cancelled"}
  end

  def com_off_aprroval_list
    employee_id = params[:employee_id]
    current_login = Employee.find_by(id: employee_id)
    @sub = current_login.subordinates
    @ind_sub = current_login.indirect_subordinates
    @emp = @sub + @ind_sub
    @leave_c_off_pending = LeaveCOff.where(employee_id: @sub,is_taken: false,status: false,is_expire: false,current_status: "Pending")
    # @leave_c_off_first_approved = LeaveCOff.where(employee_id: @ind_sub,is_taken: false,status: false,is_expire: false,current_status: "FirstApproved")
    render :json => @leave_c_off_pending.present? ? @leave_c_off_pending.collect{|coff| {:id => coff.try(:id), :employee_id => coff.try(:employee_id), :manual_employee_code => coff.try(:employee).try(:manual_employee_code), :prefix => coff.employee.try(:prefix), :employee_first_name => coff.employee.try(:first_name), :employee_middle_name => coff.employee.try(:middle_name), :employee_last_name => coff.employee.try(:last_name), :c_off_date => coff.try(:c_off_date), :c_off_type => coff.try(:c_off_type),:c_off_expire_day => coff.try(:c_off_expire_day),:expiry_status => coff.try(:expiry_status),:is_taken => coff.try(:is_taken),:expiry_date => coff.try(:expiry_date),:leave_count => coff.try(:leave_count),:is_expire => coff.try(:is_expire),:created_at => coff.try(:created_at),:status => coff.try(:status),:current_status => coff.try(:current_status),:taken_date => coff.try(:taken_date), :comment => coff.try(:comment) }} : []
  end

  def admin_com_off_aprroval
    @leave_c_off_pending = LeaveCOff.where(is_taken: false,status: false,is_expire: false,current_status: "Pending")
    render :json => @leave_c_off_pending.present? ? @leave_c_off_pending.collect{|coff| {:id => coff.try(:id), :employee_id => coff.try(:employee_id), :manual_employee_code => coff.try(:employee).try(:manual_employee_code), :prefix => coff.employee.try(:prefix), :employee_first_name => coff.employee.try(:first_name), :employee_middle_name => coff.employee.try(:middle_name), :employee_last_name => coff.employee.try(:last_name), :c_off_date => coff.try(:c_off_date), :c_off_type => coff.try(:c_off_type),:c_off_expire_day => coff.try(:c_off_expire_day),:expiry_status => coff.try(:expiry_status),:is_taken => coff.try(:is_taken),:expiry_date => coff.try(:expiry_date),:leave_count => coff.try(:leave_count),:is_expire => coff.try(:is_expire),:created_at => coff.try(:created_at),:status => coff.try(:status),:current_status => coff.try(:current_status),:taken_date => coff.try(:taken_date), :comment => coff.try(:comment) }} : []
  end

  def approve_c_off_request
    employee_id = params[:employee_id]
    coff_req_id = params[:coff_req_id]
    @leave_c_off = LeaveCOff.find(coff_req_id)
    leav_category = LeavCategory.find_by_code('C.Off')
    @current_emp = Employee.find_by(id: employee_id)
    @leave_c_off.update(expiry_status: true)
    # c_off_expire_day = params[:leave_c_off][:c_off_expire_day]
    c_off_expire_day = 45
    # if @leave_c_off.expiry_status == true
    @expiry_date = @leave_c_off.c_off_date + c_off_expire_day.to_i
    # else
    #   @expiry_date = nil
    # end
    @leave_c_off.update(status: true,current_status: "FinalApproved",expiry_date: @expiry_date,c_off_expire_day: c_off_expire_day)
    StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: employee_id,status: "FinalApproved")
    # else
    #     @leave_c_off.update(status: true,current_status: "FinalApproved")
    #     StatusCOff.create(leave_c_off_id: @leave_c_off.id,employee_id: employee_id,status: "FinalApproved")     
    # end#@leave_c_off.current_status != "FirstApproved" 
    is_exist = EmployeeLeavBalance.exists?(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id)
    if is_exist
      @employee_leave_balance = EmployeeLeavBalance.where(employee_id: @leave_c_off.employee_id, leav_category_id: leav_category.id).take
      @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
      if @leave_c_off.c_off_type == 'Full Day'
        @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 1
        @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 1
        @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
        @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
        @c_off.each do |l|
          if l.try(:expiry_date).to_date < Date.today
            @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
            @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
            LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
            @employee_leave_balance.save
          else
            @employee_leave_balance.save
          end
        end
      else #Half Day
        @employee_leave_balance.total_leave = @employee_leave_balance.total_leave.to_f + 0.5
        @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f + 0.5
        @leave_c_off.leave_count = 0.5
        @employee_leave_balance.update(expiry_date: @leave_c_off.expiry_date)
        @employee_leave_balance.update(to_date: @leave_c_off.expiry_date)
        @c_off.each do |l|
          if l.try(:expiry_date) < Date.today
            @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take
            @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
            LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
            @employee_leave_balance.save
          else
            @employee_leave_balance.save
          end
        end
      end
    else #is_exist
      @employee_leave_balance = EmployeeLeavBalance.new do |b|
        b.employee_id = @leave_c_off.employee_id
        b.leav_category_id = leav_category.id
        if @leave_c_off.expiry_status == true
          b.expiry_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
        else
        end
        b.from_date = @leave_c_off.c_off_date
        b.is_active = true
        b.to_date = @leave_c_off.c_off_date + @leave_c_off.c_off_expire_day
        @c_off = LeaveCOff.where(is_expire: false,expiry_status: true)
        if @leave_c_off.c_off_type == "Full Day"
          b.no_of_leave = 1
          b.total_leave = 1
          @leave_c_off.leave_count = 1
          puts @leave_c_off.leave_count
        else
          b.no_of_leave = 0.5
          b.total_leave = 0.5
          @leave_c_off.leave_count = 0.5
          puts @leave_c_off.leave_count
        end
      end #do
      @employee_leave_balance.save
      @c_off.each do |l|
        if l.try(:expiry_date).to_date < Date.today
          @employee_leave_balance = EmployeeLeavBalance.where(employee_id: l.employee_id,leav_category_id: leav_category.id).take  
          @employee_leave_balance.no_of_leave = @employee_leave_balance.no_of_leave.to_f - l.leave_count
          LeaveCOff.where(id: l.id).update_all(leave_count: 0,is_expire: true)
          @employee_leave_balance.save
        else
          @employee_leave_balance.save
        end
      end #do
    end #is_exist
    COffMailer.final_approved(@leave_c_off, @current_emp).deliver_now
    render :status=>200, :json=>{:status=> "Approved successfully" }
  end

  def reject_c_off_request
    employee_id = params[:employee_id]
    coff_req_id = params[:coff_req_id]
    @leave_c_off = LeaveCOff.find(coff_req_id)
    @status_c_off = StatusCOff.find_by(leave_c_off_id: @leave_c_off.id)
    @status_c_off.destroy
    @leave_c_off.destroy
    COffMailer.first_reject(@leave_c_off).deliver_now
    render :status=>200, :json=>{:status=> "Rejected successfully" }
  end

  def travel_request_list
    travel_req_id = params[:travel_req_id]
    travel_requests = TravelRequest.where(id: travel_req_id)
    render :json => travel_requests.present? ? travel_requests.collect{|travel_req| {:id => travel_req.try(:id), :manual_employee_code => travel_req.try(:employee).try(:manual_employee_code), :prefix => travel_req.employee.try(:prefix), :employee_first_name => travel_req.employee.try(:first_name), :employee_middle_name => travel_req.employee.try(:middle_name), :employee_last_name => travel_req.employee.try(:last_name), :employee_id => travel_req.try(:employee_id), :application_date => travel_req.try(:application_date), :traveling_date => travel_req.try(:traveling_date), :to => travel_req.try(:to), :total_advance => travel_req.try(:total_advance), :tour_purpose => travel_req.try(:tour_purpose), :place => travel_req.try(:place), :current_status => travel_req.try(:current_status), :traveling_advance => travel_req.try(:traveling_advance), :department => travel_req.try(:employee).try(:department).try(:name), :day => travel_req.try(:day), :travel_mode => travel_req.try(:travel_mode).try(:name) }} : []
  end

  def admin_travel_approval_list
    travel_requests = TravelRequest.where("current_status = ? or current_status = ? or current_status = ?", "Pending","FirstApproved","Approved & Send Next")
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status),:is_confirm => travel_list.try(:is_confirm), :all_status => travel_list.try(:reporting_masters_travel_requests) }} : []
  end

  def expense_claim_list
    employee_id = params[:employee_id]
    travel_requests = TravelRequest.where("employee_id = ? AND current_status = ?", employee_id, "FinalApproved" ).order("id DESC")
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status),:is_confirm => travel_list.try(:is_confirm), :all_status => travel_list.try(:reporting_masters_travel_requests) }} : []
  end

  def expense_type_list
    all_travel_expence_type = TravelExpenceType.all
    render :json => all_travel_expence_type.present? ? all_travel_expence_type.collect{|tet| {:id => tet.try(:id), :code => tet.try(:code), :name => tet.try(:name), :description => tet.try(:description), :is_confirm => tet.try(:is_confirm) }} : []
  end
  
  def all_currency
    all_currency = CurrencyMaster.all
    render :json => all_currency.present? ? all_currency.collect{|cm| {:id => cm.try(:id), :code => cm.try(:code), :name => cm.try(:name), :description => cm.try(:description), :is_confirm => cm.try(:is_confirm) }} : []
  end

  def claim_list
    travel_request_id = params[:travel_req_id]
    @daily_bill_details = DailyBillDetail.where(travel_request_id: travel_request_id).order("expence_date ASC") 
    render :json => @daily_bill_details.present? ? @daily_bill_details.collect{|dbd| {:id => dbd.try(:id), :expence_date => dbd.try(:expence_date), :travel_request_id => dbd.try(:travel_request_id), :e_place => dbd.try(:e_place), :travel_expence_type => dbd.try(:travel_expence_type).try(:name), :travel_expence => dbd.try(:travel_expence), :currency_master => dbd.try(:currency_master).try(:name), :request_status => dbd.try(:request_status), :is_confirm => dbd.try(:is_confirm), :expence_opestion_id => dbd.try(:expence_opestion).try(:name), :mode_id => dbd.try(:mode).try(:name), :billing_option_id => dbd.try(:billing_option).try(:name), :billing_opestion => dbd.try(:billing_opestion) }} : []
  end

  def claim_list_total
    travel_request_id = params[:travel_req_id]
    @daily_bill_details = DailyBillDetail.where(travel_request_id: travel_request_id).order("expence_date ASC") 
    render :status=>200, :json=>{:total=> @daily_bill_details.sum(:travel_expence) }
  end

  def cancel_coff_request
    coff_req_id = params[:coff_req_id]
    @leave_c_off = LeaveCOff.find(coff_req_id)
    @status_c_off = StatusCOff.where(leave_c_off_id: @leave_c_off)
    @status_c_off.destroy_all
    @leave_c_off.destroy
    render :status=>200, :json=>{:status=> "Destroyed successfully" }
  end

  def approve_travel_request
    travel_req_id = params[:travel_req_id]
    employee_id = params[:employee_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "Approved",reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: employee_id,travel_status: "Approved")
    render :status=>200, :json=>{:status=> "Travel Request Approved Successfully" }
  end

  def reject_travel_request
    travel_req_id = params[:travel_req_id]
    employee_id = params[:employee_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "Rejected",reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(reporting_master_id: employee_id, travel_request_id: @travel_request.id,travel_status: "Rejected")
    render :status=>200, :json=>{:status=> "Travel Request Rejected Successfully" }
  end

  def final_approval_travel_list
    travel_requests = TravelRequest.where(current_status: "Approved")
    render :json => travel_requests.present? ? travel_requests.collect{|travel_req| {:id => travel_req.try(:id), :manual_employee_code => travel_req.try(:employee).try(:manual_employee_code), :prefix => travel_req.employee.try(:prefix), :employee_first_name => travel_req.employee.try(:first_name), :employee_middle_name => travel_req.employee.try(:middle_name), :employee_last_name => travel_req.employee.try(:last_name), :employee_id => travel_req.try(:employee_id), :application_date => travel_req.try(:application_date), :traveling_date => travel_req.try(:traveling_date), :to => travel_req.try(:to), :total_advance => travel_req.try(:total_advance), :tour_purpose => travel_req.try(:tour_purpose), :place => travel_req.try(:place), :current_status => travel_req.try(:current_status), :traveling_advance => travel_req.try(:traveling_advance), :department => travel_req.try(:employee).try(:department).try(:name), :day => travel_req.try(:day), :travel_mode => travel_req.try(:travel_mode).try(:name) }} : []
  end

  def employee_expense_claim_request
    employee_id = params[:employee_id]
    manager1_id = params[:manager1_id]
    manager2_id = params[:manager2_id]
    travel_request_id = params[:id]
    expence_date = params[:selectedDate]
    e_place = params[:place]
    travel_expence_type_id = params[:expense_type]
    travel_expence = params[:expense_amount]
    currency_master_id = params[:currency]
    expence_opestion_id = params[:expence_option]
    mode_id = params[:mode]
    billing_opestion  = params[:billing_option]
    billing_option_id = params[:option]
    @expenc = ExpensesMaster.where(expence_opestion_id: expence_opestion_id, mode_id: mode_id, billing_opestion: billing_opestion, billing_option_id: billing_option_id)
    if @expenc.present?
      min_amount = @expenc.last.min_amount
      max_amount = @expenc.last.max_amount
      t_exp = travel_expence.to_f
      if t_exp.between?(min_amount, max_amount).present?
        @daily_bill_detail = DailyBillDetail.create(travel_request_id: travel_request_id, expence_date: expence_date, e_place: e_place, travel_expence_type_id: travel_expence_type_id, travel_expence: travel_expence, currency_master_id: currency_master_id, expence_opestion_id: expence_opestion_id, mode_id: mode_id, billing_opestion: billing_opestion, billing_option_id: billing_option_id)
        render :status=>200, :json=>{:status=> "Daily Bill Detail saved Successfully." }
      else
        render :status=>200, :json=>{:status=>  "Please Enter Expense Amount from #{min_amount} to #{max_amount} Not Found" }
      end
    else
      render :status=>200, :json=>{:status=> "Please Contact To Admin" }
    end
  end

  def collect_expence_opestion
    employee_id = params[:employee_id]
    emp = Employee.find(employee_id)
    employee_grade = emp.try(:joining_detail).try(:employee_grade).try(:id)
    expence_opestion = ExpenceOpestion.where(employee_grade_id: employee_grade)
    render :json => expence_opestion.present? ? expence_opestion.collect{|exp| {:id => exp.try(:id), :employee_grade_id => exp.try(:employee_grade_id), :code => exp.try(:code), :name => exp.try(:name), :description => exp.try(:description), :status => exp.try(:status)  }} : []
  end

  def collect_mode
    expence_opestion_id = params[:expence_opestion_id]
    @mode = Mode.where(expence_opestion_id: expence_opestion_id)
    render :json => @mode.present? ? @mode.collect{|exp| {:id => exp.try(:id), :expence_opestion_id => exp.try(:expence_opestion_id), :code => exp.try(:code), :name => exp.try(:name), :description => exp.try(:description), :status => exp.try(:status)  }} : []
  end

  def collect_opestion
    mode_id = params[:mode_id]
    mode = Mode.find(mode_id)
    expence_opestion = mode.expence_opestion_id
    @billing_option = BillingOption.where(expence_opestion_id: expence_opestion)
    render :json => @billing_option.present? ? @billing_option.collect{|exp| {:id => exp.try(:id), :expence_opestion_id => exp.try(:expence_opestion_id), :code => exp.try(:code), :name => exp.try(:name), :description => exp.try(:description), :status => exp.try(:status)  }} : []
  end

  def final_approve_travel_request
    employee_id = params[:employee_id]
    travel_req_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "FinalApproved",reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: employee_id, travel_status: "FinalApproved")
    render :status=>200, :json=>{:status=> "Travel Request Approved Successfully" }
  end
  
  def final_reject_travel_request
    employee_id = params[:employee_id]
    travel_req_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "Rejected", reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(reporting_master_id: employee_id, travel_request_id: @travel_request.id,travel_status: "Rejected")
    render :status=>200, :json=>{:status=> "Travel Request Rejected Successfully" }
  end

  def edit_claim
    employee_id = params[:employee_id]
    manager1_id = params[:manager1_id]
    manager2_id = params[:manager2_id]
    travel_request_id = params[:id]
    expence_date = params[:selectedDate]
    e_place = params[:place]
    travel_expence_type_id = params[:expense_type]
    travel_expence = params[:expense_amount]
    currency_master_id = params[:currency]
    daily_bill_detail = params[:daily_bill_detail]
    @daily_bill = DailyBillDetail.find(daily_bill_detail)
    @daily_bill_detail = @daily_bill.update(travel_request_id: travel_request_id, expence_date: expence_date, e_place: e_place, travel_expence_type_id: travel_expence_type_id, travel_expence: travel_expence , currency_master_id: currency_master_id)
    render :status=>200, :json=>{:status=> "Updated successfully" }
  end
  
  def delete_expense_claim
    daily_bill_detail = params[:expense_req_id]
    @daily_bill = DailyBillDetail.find(daily_bill_detail)
    @daily_bill.destroy
    render :status=>200, :json=>{:status=> "Deleted successfully" }
  end

  def employee_claim_request
    travel_request_id = params[:id]
    @travel_request = TravelRequest.find(travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id)
    @reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[0]
    @reporting_masters_travel_requests_1 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[1] #new code
    ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests.id).update_all(status: true) #new code
    DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests.reporting_master_id,is_confirm: true)
    c1 = @daily_bill_details.sum(:travel_expence).to_i
    TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests_1.reporting_master_id,is_confirm: true,expense: c1)
    @travel_req = TravelRequest.find_by(id: @travel_request.id)
    @report = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id).first
    c1 = @travel_request.total_advance - @travel_req.expense
    if @report.status == true  && @report.travel_status == "Pending"
      @travel_expence = TravelExpence.create(travel_request_id: @travel_request.id,total_advance_amount: @travel_request.total_advance,total_expence_amount: @travel_req.expense,remaining_amount: c1)
    else
    end
    if c1<0
      TravelExpence.where(travel_request_id: @travel_request.id).update_all(employee_amount: c1.abs)
    else
      TravelExpence.where(travel_request_id: @travel_request.id).update_all(company_amount: c1.abs)
    end
    render :status=>200, :json=>{:status=> "Confirmed Successfully" }
  end

  def final_reject_travel_request
    travel_request_id = params[:travel_req_id]
    employee_id = params[:employee_id]
    @travel_request = TravelRequest.find(travel_request_id)
    @travel_request.update(current_status: "Rejected",reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(reporting_master_id: employee_id, travel_request_id: @travel_request.id,travel_status: "Rejected")
    render :status=>200, :json=>{:status=> "Travel Request Rejected Successfully" }
  end

  def final_approve_travel_request
    travel_request_id = params[:travel_req_id]
    employee_id = params[:employee_id]
    @travel_request = TravelRequest.find(travel_request_id)
    @travel_request.update(current_status: "FinalApproved",reporting_master_id: employee_id)
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id,reporting_master_id: employee_id,travel_status: "FinalApproved")
    render :status=>200, :json=>{:status=> "Travel Request FinalApproved Successfully" }
  end

  def expense_claim_approval_list
    employee_id = params[:employee_id]
    travel_requests = TravelRequest.where(current_status: "FinalApproved",reporting_master_id: employee_id, is_confirm: true)
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status), :all_status => travel_list.try(:reporting_masters_travel_requests), :application_date => travel_list.try(:application_date), :company_location => travel_list.try(:employee).try(:company_location).try(:name), :department => travel_list.try(:employee).try(:department).try(:name), :travel_option => travel_list.try(:travel_option).try(:name), :travel_mode => travel_list.try(:travel_mode).try(:name), :from_date => travel_list.try(:traveling_date), :to_date => travel_list.try(:to), :day => travel_list.try(:day), :total_advance => travel_list.try(:total_advance), :is_confirm => travel_list.try(:is_confirm) }} : []
  end

  def all_claim_expense_list
    travel_request_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_request_id)
    travel_expence = TravelExpence.where(travel_request_id: @travel_request.id)
    if travel_expence.present?
      render :json => travel_expence.present? ? travel_expence.collect{|travel_list| {:id => travel_list.try(:id), :total_advance_amount => travel_list.try(:total_advance_amount), :total_expence_amount => travel_list.try(:total_expence_amount), :company_amount => travel_list.try(:company_amount), :employee_amount => travel_list.try(:employee_amount) }} : []
    else
      render :status=>200, :json=>{:status=> "Travel Expence Not present" }
    end    
  end

  def second_expense_claim_list
    travel_request_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_request_id)
    @daily_bill_details = DailyBillDetail.where(travel_request_id: @travel_request.id, is_confirm: true)
    render :json => @daily_bill_details.present? ? @daily_bill_details.collect{|dbd| {:id => dbd.try(:id), :expence_date => dbd.try(:expence_date), :e_place => dbd.try(:e_place), :travel_expence_type => dbd.try(:travel_expence_type).try(:name), :travel_expence => dbd.try(:travel_expence) }} : []
  end

  def claim_approve_request
    status  = ''
    travel_request_id = params[:travel_req_id]
    comment = params[:comment]
    @travel_request = TravelRequest.find(travel_request_id)

    DailyBillDetail.where(travel_request_id: @travel_request.id).update_all(request_status: "Approved & Send Next")

    @reporting_masters_travel_requests2 = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[1]
    @reporting_masters_travel_requests3_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[2]
    @reporting_masters_travel_requests4_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[3]
    @reporting_masters_travel_requests5_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[4]
    @reporting_masters_travel_requests6_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[5]
    @reporting_masters_travel_requests7_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[6]
    @reporting_masters_travel_requests8_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[7]
    @reporting_masters_travel_requests9_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[8]
    @reporting_masters_travel_requests10_new = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)[9]

    if @reporting_masters_travel_requests2.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests2.id).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests3_new.reporting_master_id)
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests3_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests3_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests4_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests4_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests4_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests5_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests5_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests5_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests6_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests6_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests6_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests7_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests7_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests7_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests8_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests8_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests8_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests9_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'

    elsif @reporting_masters_travel_requests9_new.try(:status) == nil
      ReportingMastersTravelRequest.where(id: @reporting_masters_travel_requests9_new.try(:id)).update_all(status: true,daily_bill_comment: comment)
      TravelRequest.where(id: @travel_request.id).update_all(reporting_master_id: @reporting_masters_travel_requests10_new.try(:reporting_master_id))
      status = 'Daily Bill Request Send To Higher Authority For Approval'
    else
    end
    if status.empty?
      render :status=>200, :json=>{:status=> "Success"}
    else
      render :status=>200, :json=>{:status=> status }
    end
  end

  def admin_expense_claim_approval_list
    travel_requests = TravelRequest.where(current_status: "FinalApproved")
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status),:is_confirm => travel_list.try(:is_confirm), :all_status => travel_list.try(:reporting_masters_travel_requests), :application_date => travel_list.try(:application_date), :company_location => travel_list.try(:employee).try(:company_location).try(:name), :department => travel_list.try(:employee).try(:department).try(:name), :travel_option => travel_list.try(:travel_option).try(:name), :travel_mode => travel_list.try(:travel_mode).try(:name), :from_date => travel_list.try(:traveling_date), :to_date => travel_list.try(:to), :day => travel_list.try(:day), :total_advance => travel_list.try(:total_advance), :tour_purpose => travel_list.try(:tour_purpose) }} : []
  end

  def all_travel_history
    employee_id = params[:employee_id]
    travel_requests = TravelRequest.where(employee_id: employee_id).order("id DESC")
    render :json => travel_requests.present? ? travel_requests.collect{|travel_list| {:id => travel_list.try(:id), :manual_employee_code => travel_list.try(:employee).try(:manual_employee_code), :prefix => travel_list.employee.try(:prefix), :employee_first_name => travel_list.employee.try(:first_name), :employee_middle_name => travel_list.employee.try(:middle_name), :employee_last_name => travel_list.employee.try(:last_name),:code => travel_list.try(:code), :place => travel_list.try(:place), :current_status => travel_list.try(:current_status),:is_confirm => travel_list.try(:is_confirm), :all_status => travel_list.try(:reporting_masters_travel_requests), :application_date => travel_list.try(:application_date), :company_location => travel_list.try(:employee).try(:company_location).try(:name), :department => travel_list.try(:employee).try(:department).try(:name), :travel_option => travel_list.try(:travel_option).try(:name), :travel_mode => travel_list.try(:travel_mode).try(:name), :from_date => travel_list.try(:traveling_date), :to_date => travel_list.try(:to), :day => travel_list.try(:day), :total_advance => travel_list.try(:total_advance), :tour_purpose => travel_list.try(:tour_purpose) }} : []
  end

  def cancel_travel_history
    employee_id = params[:employee_id]
    travel_req_id = params[:travel_req_id]
    @travel_request = TravelRequest.find(travel_req_id)
    @travel_request.update(current_status: "Cancelled",reporting_master_id: employee_id)
    TravelRequestHistory.create(employee_id: employee_id,travel_request_id: @travel_request.id,application_date: @travel_request.application_date,traveling_date: @travel_request.traveling_date, tour_purpose: @travel_request.tour_purpose, place: @travel_request.place,total_advance: @travel_request.total_advance,reporting_master_id: @travel_request.reporting_master_id, travel_option_id: @travel_request.travel_option_id,current_status: "Cancelled")
    ReportingMastersTravelRequest.create(travel_request_id: @travel_request.id, reporting_master_id: employee_id, travel_status: "Cancelled")
    render :status=>200, :json=>{:status=> "Travel Request Cancelled"}
  end

  def get_time_sheet
    employee_id = params[:employee_id]
    manager_id = params[:manager_id]
    date = params[:date]
    if !employee_id.present? and manager_id.present?
      @employee = Employee.where(manager_id: manager_id).pluck(:id)
      employee_daily_activities = EmployeeDailyActivity.where(employee_id: @employee, day: date.to_date).order("day asc")
    else employee_id.present? and manager_id.present?
      employee_daily_activities = EmployeeDailyActivity.where(employee_id: employee_id, day: date.to_date).order("day asc")
    end
    render :json => employee_daily_activities.present? ? employee_daily_activities.collect{|emp| { id: emp.id, :manual_employee_code => emp.try(:employee).try(:manual_employee_code), :prefix => emp.employee.try(:prefix), :employee_first_name => emp.employee.try(:first_name), :employee_middle_name => emp.employee.try(:middle_name), :employee_last_name => emp.employee.try(:last_name), :employee_id => emp.employee_id, :project_master_id => emp.try(:project_master).try(:name), :today_activity => emp.today_activity, :tomorrow_plan => emp.tomorrow_plan, :day => emp.day }} : []
  end

  def get_help_disk_list
    employee_id = params[:employee_id]
    issue_requests = IssueRequest.where(employee_id: employee_id)
    render :json => issue_requests.present? ? issue_requests.collect{|issue_requests| {:id => issue_requests.try(:id), :manual_employee_code => issue_requests.try(:employee).try(:manual_employee_code), :prefix => issue_requests.employee.try(:prefix), :employee_first_name => issue_requests.employee.try(:first_name), :employee_middle_name => issue_requests.employee.try(:middle_name), :employee_last_name => issue_requests.employee.try(:last_name), :issue_master_id => issue_requests.try(:issue_master).try(:name), :issue_tracker_member_id => issue_requests.try(:issue_tracker_member).try(:name), :issue_tracker_group_id => issue_requests.try(:issue_tracker_group).try(:name), :description => issue_requests.try(:description), :date => issue_requests.try(:date),:time => issue_requests.try(:time), :employee_id => issue_requests.try(:employee_id), :issue_priority => issue_requests.try(:issue_priority),:is_confirm => issue_requests.try(:is_confirm), :status => issue_requests.try(:status), :issue_root_cause => issue_requests.try(:issue_root_cause).try(:name), :effort_time => issue_requests.try(:effort_time).try(:name), :comment => issue_requests.try(:comment), :is_complete => issue_requests.try(:is_complete), :contact_no => issue_requests.try(:employee).try(:contact_no), :email => issue_requests.try(:employee).try(:email), :department => issue_requests.try(:employee).try(:department).try(:name), :document1_file_name => issue_requests.try(:document1_file_name), :document2_file_name => issue_requests.try(:document2_file_name), :support_description => issue_requests.try(:issue_master).try(:description) }} : []
  end

  def cancel_help_desk_request
    employee_id = params[:employee_id]
    help_desk_id = params[:help_desk_id]
    @issue_requests = IssueRequest.find_by_id(help_desk_id)
    if @issue_requests.present?
      @issue_requests.destroy
      render :status=>200, :json=>{:status=> 'Support request was successfully destroyed.' }
    else
      render :status=>200, :json=>{:status=> 'Support Request Not Found' }
    end
  end

  def group_type
    issue_tracker_group = IssueTrackerGroup.all
    render :json => issue_tracker_group.present? ? issue_tracker_group.collect{|issue_tracker_group| { :id => issue_tracker_group.id, :name => issue_tracker_group.name, :email => issue_tracker_group.try(:email), :contact_number => issue_tracker_group.contact_number, :status => issue_tracker_group.status, :is_confirm => issue_tracker_group.is_confirm }} : []
  end

  def collect_issues
    issue_tracker_group = IssueTrackerGroup.find(params[:group_id])
    issue_masters = issue_tracker_group.issue_masters
    render :json => issue_masters.present? ? issue_masters.collect{|issue_masters| { :id => issue_tracker_group.id, :issue_tracker_group_id => issue_masters.issue_tracker_group_id, :issue_type_id => issue_masters.try(:issue_type_id), :name => issue_masters.name, :description => issue_masters.description, :status => issue_masters.status, :is_confirm => issue_masters.is_confirm }} : []
  end

  def collect_issues_description
    @issue_master_id = IssueMaster.find(params[:issue_type_id])
    @des = @issue_master_id.description
    render :status=>200, :json=>{:description => @des }
  end
  
  def daily_bill_request_confirmation
    travel_request_id = params[:travel_requests_id]
    @travel_request = TravelRequest.find(travel_request_id)
    reporting_masters_travel_requests = ReportingMastersTravelRequest.where(travel_request_id: @travel_request.id)
    render :json => reporting_masters_travel_requests.present? ? reporting_masters_travel_requests.collect{|rep_mas_tra_req| { :id => rep_mas_tra_req.id, :travel_request_id => rep_mas_tra_req.travel_request_id, :reporting_master_id => rep_mas_tra_req.reporting_master_id, :travel_status => rep_mas_tra_req.travel_status, :status => rep_mas_tra_req.status, :daily_bill_comment => rep_mas_tra_req.daily_bill_comment }} : []
  end

  def lock_request_list
    employee_id = params[:employee_id]
    @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: employee_id)
    issue_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_member_id.issue_tracker_group_id,status: nil)
    render :json => issue_requests.present? ? issue_requests.collect{|issue_requests| {:id => issue_requests.try(:id), :tracker_member_employee_id => issue_requests.try(:issue_tracker_member).try(:employee_id), :manual_employee_code => issue_requests.try(:employee).try(:manual_employee_code), :prefix => issue_requests.employee.try(:prefix), :employee_first_name => issue_requests.employee.try(:first_name), :employee_middle_name => issue_requests.employee.try(:middle_name), :employee_last_name => issue_requests.employee.try(:last_name), :issue_master_id => issue_requests.try(:issue_master).try(:name), :issue_tracker_member_id => issue_requests.try(:issue_tracker_member).try(:name), :issue_tracker_group_id => issue_requests.try(:issue_tracker_group).try(:name), :description => issue_requests.try(:description), :date => issue_requests.try(:date),:time => issue_requests.try(:time), :employee_id => issue_requests.try(:employee_id), :issue_priority => issue_requests.try(:issue_priority),:is_confirm => issue_requests.try(:is_confirm), :status => issue_requests.try(:status), :issue_root_cause => issue_requests.try(:issue_root_cause).try(:name), :effort_time => issue_requests.try(:effort_time).try(:name), :comment => issue_requests.try(:comment), :is_complete => issue_requests.try(:is_complete), :contact_no => issue_requests.try(:employee).try(:contact_no), :email => issue_requests.try(:employee).try(:email), :department => issue_requests.try(:employee).try(:department).try(:name), :document1_file_name => issue_requests.try(:document1_file_name), :document2_file_name => issue_requests.try(:document2_file_name), :support_description => issue_requests.try(:issue_master).try(:description), :statuss => issue_requests.try(:status) }} : []
  end

  def solved_issue_list
    employee_id = params[:employee_id]
    @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: employee_id)
    solved_requests = IssueRequest.where(issue_tracker_group_id: @issue_tracker_member_id.issue_tracker_group_id,status: true)
    render :json => solved_requests.present? ? solved_requests.collect{|issue_requests| {:id => issue_requests.try(:id), :tracker_member_employee_id => issue_requests.try(:issue_tracker_member).try(:employee_id), :manual_employee_code => issue_requests.try(:employee).try(:manual_employee_code), :prefix => issue_requests.employee.try(:prefix), :employee_first_name => issue_requests.employee.try(:first_name), :employee_middle_name => issue_requests.employee.try(:middle_name), :employee_last_name => issue_requests.employee.try(:last_name), :issue_master_id => issue_requests.try(:issue_master).try(:name), :issue_tracker_member_id => issue_requests.try(:issue_tracker_member).try(:name), :issue_tracker_group_id => issue_requests.try(:issue_tracker_group).try(:name), :description => issue_requests.try(:description), :date => issue_requests.try(:date), :employee_id => issue_requests.try(:employee_id), :issue_priority => issue_requests.try(:issue_priority),:is_confirm => issue_requests.try(:is_confirm), :status => issue_requests.try(:status), :issue_root_cause => issue_requests.try(:issue_root_cause).try(:name), :effort_time => issue_requests.try(:effort_time).try(:name), :comment => issue_requests.try(:comment), :is_complete => issue_requests.try(:is_complete), :contact_no => issue_requests.try(:employee).try(:contact_no), :email => issue_requests.try(:employee).try(:email), :department => issue_requests.try(:employee).try(:department).try(:name), :document1_file_name => issue_requests.try(:document1_file_name), :document2_file_name => issue_requests.try(:document2_file_name), :support_description => issue_requests.try(:issue_master).try(:description) }} : []
  end

  def manager_daily_attendance
    emp_code = params[:employee_id]
    date = params[:date]
    emp_daily_att = DailyAttendance.where(employee_code: emp_code, date: date).order("id DESC")
    render :json => emp_daily_att.present? ? emp_daily_att.collect{|eda| { :id => eda.id, :date => eda.date, :time => eda.time.strftime("%I:%M %p"), :employee_code => eda.employee_code, :latitude => eda.latitude, :longitude => eda.longitude, :place => eda.place, :note => eda.comment }} : []
  end

  def create_support_request
    employee_id = params[:employee_id]
    date = params[:date]
    time = params[:time]
    group_id = params[:group_id]
    master_id = params[:master_id]
    issue_priority = params[:issue_priority]
    description = params[:description]

    @issue_request = IssueRequest.new(employee_id: employee_id, date: date, time: time, issue_tracker_group_id: group_id, issue_master_id: master_id, issue_priority: issue_priority, description: description)
    if @issue_request.save
      IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,status: @issue_request.status,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority)
      @c1 = IssueTrackerGroup.where(id: @issue_request.issue_tracker_group_id).pluck(:id)
      @c2 = IssueTrackerMember.where(issue_tracker_group_id: @c1).pluck(:employee_id)
      @emp = Employee.where(id: @c2)
      @emp.each do |s|
        IssueRequestMailer.issue_tracker_group_email(s.email, @issue_request, @c1, @c2).deliver_now
      end
      render :status=>200, :json=>{:status=> 'Support request was Successfully saved' }
    else
      render :status=>200, :json=>{:status=> 'unprocessable_entity' }
    end
  end

  def unlock_request
    issue_request = params[:issue_request]
    @issue_request = IssueRequest.find(issue_request)
    @issue_request.update(issue_tracker_member_id: nil,status: nil)
    @issue_locker = IssueLocker.where(issue_request_id: @issue_request.id).take
    IssueLocker.where(issue_request_id: @issue_request.id).update_all(status: nil)
    IssueLockerHistory.create(issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_locker_id: @issue_locker.id,issue_request_id: @issue_request.id,status: nil)
    render :status=>200, :json=>{:status=> 'Support Request Unlocked Successfully' }
  end

  def lock_request
    issue_request = params[:issue_request]
    lock_date = params[:date]
    lock_time = params[:time]
    employee_id = params[:employee_id]
    @issue_tracker_member = params[:issue_tracker_member_id]
    @issue_request = IssueRequest.find(issue_request)
    IssueRequest.where(id: @issue_request.id).update_all(issue_tracker_member_id: @issue_tracker_member)
    @issue_tracker_member_id = IssueTrackerMember.find_by(employee_id: employee_id)
    @c1=IssueLocker.create(lock_time: lock_time,lock_date: lock_date,issue_request_id: @issue_request.id,status: true,issue_tracker_member_id: @issue_tracker_member)
    IssueLockerHistory.create(lock_time: lock_time,lock_date: lock_date,issue_tracker_member_id: @issue_tracker_member,issue_locker_id: @c1.id,issue_request_id: @issue_request.id,status: true)
    render :status=>200, :json=>{:status=> 'Support Request Locked Successfully' }
  end

  def solved_request
    issue_request = params[:issue_request]
    description = params[:description]
    effort_time = params[:effort_time]
    time = params[:time]
    employee_id = params[:employee_id]
    support_root_cause = params[:support_root_cause_id]
    comment = params[:comment]
    @issue_request = IssueRequest.find(issue_request)
    @issue_request.update(status: true, issue_root_cause_id: support_root_cause, comment: comment, time: time, effort_time: effort_time)
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: true)
    render :status=>200, :json=>{:status=> 'Support Request Solved Successfully' }
  end

  def issue_tracker_member_list
    issue_request = params[:issue_request]
    issue_tracker_member = IssueTrackerMember.where(status: true,issue_tracker_group_id: issue_request)
    render :json => issue_tracker_member.present? ? issue_tracker_member.collect{|itm| { :id => itm.id, :prefix => itm.employee.prefix, :employee_first_name => itm.employee.first_name, :employee_middle_name => itm.employee.middle_name, :employee_last_name => itm.employee.last_name }} : []
  end

  def support_root_cause_list
    all_issue_root_cause = IssueRootCause.all
    render :json => all_issue_root_cause.present? ? all_issue_root_cause.collect{|itm| { :id => itm.id, :name => itm.name }} : []
  end

  def solved_confirm
    issue_request = params[:issue_request]
    @issue_request = IssueRequest.find(issue_request)
    @issue_request.update(is_complete: true)
    render :status=>200, :json=>{:status=> 'Support Request Confirmed Successfully' }
  end

  def resend_request
    issue_request = params[:issue_request]
    @issue_request = IssueRequest.find(issue_request)
    IssueRequest.where(id: @issue_request.id).update_all(status: nil,issue_tracker_member_id: nil,issue_root_cause_id: nil,effort_time: nil,comment: nil) 
    IssueHistory.create(issue_tracker_group_id: @issue_request.issue_tracker_group_id,issue_request_id: @issue_request.id,issue_master_id: @issue_request.issue_master_id,description: @issue_request.description,date: @issue_request.date,time: @issue_request.time,employee_id: @issue_request.employee_id,issue_tracker_member_id: @issue_request.issue_tracker_member_id,issue_priority: @issue_request.issue_priority,status: nil)
    # IssueRequestMailer.issue_resend(@issue_request).deliver_now
    render :status=>200, :json=>{:status=> 'Support Request Resend Successfully' }
  end

  def active_leaving_reason
    leaving_reason = LeavingReason.where(is_confirm: true)
    render :json => leaving_reason.present? ? leaving_reason.collect{|itm| { :id => itm.id, :name => itm.name, :code => itm.code, :description => itm.description, :is_confirm => itm.is_confirm}} : []
  end

  def display_notice_period
    employee_id = params[:employee_id]
    @employee = Employee.find(employee_id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @notice_period = @joining_detail.notice_period_after_probation
    render :status=>200, :json=>{:status=> @notice_period}
  end

  def create_self_resignation
    @employee_resignation = EmployeeResignation.new
    employee_id = params[:employee_id]
    application_date = Date.today
    resignation_date = params[:resignation_date]
    leaving_reason_id = params[:leaving_reason_id]
    tentative_leaving_date = params[:tentative_leaving_date]
    reason = params[:reason]
    note = params[:note]
    status  = ''
    @employee = Employee.find_by(id: employee_id)
    @joining_detail = JoiningDetail.find_by_employee_id(@employee.id)
    @notice_period = @joining_detail.notice_period_after_probation

    if resignation_date == "" || leaving_reason_id == "" || tentative_leaving_date == "" || reason == ""
      status = "Please fill all mandatory fields!"
    else
      if @employee_resignation.is_there_self(employee_id)
      status = "Your Request already has been sent"
     else
        @employees=Employee.find_by(id: employee_id)
        @date_diff = (tentative_leaving_date.to_date - resignation_date.to_date).to_i

        @employee_resignation = EmployeeResignation.create(short_notice_period: @date_diff,reporting_master_id: @employees.manager_id,is_pending: true,resign_status: "Pending",is_first_approved: false,is_first_rejected: false, is_cancelled: false,employee_id: employee_id,resignation_date: resignation_date,application_date: application_date,reason: reason,note: note,leaving_reason_id: leaving_reason_id,notice_period: @notice_period,tentative_leaving_date: tentative_leaving_date)  
        @resignation_status_record = ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "Pending",change_date: Date.today)
        EmployeeResignationMailer.resignation_request(@employee_resignation).deliver_now
        # status = "Created Successfully!"
      end#is_there?
    end#nil
      # redirect_to employee_resignation_self_services_path
    if status.empty?
      render :status=>200, :json=>{:status=> "Created Successfully!"}
    else
      render :status=>200, :json=>{:status=> status }
    end
  end

  def pending_resignation_requests
    employee_id = params[:employee_id]
    pending_employee_resignation = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false,reporting_master_id: employee_id)
    render :json => pending_employee_resignation.present? ? pending_employee_resignation.collect{|er| { :id => er.id, :manual_employee_code => er.try(:employee).try(:manual_employee_code), :prefix => er.try(:employee).try(:prefix), :employee_first_name => er.try(:employee).try(:first_name), :employee_middle_name => er.try(:employee).try(:middle_name), :employee_last_name => er.try(:employee).try(:last_name), :employee_id => er.employee_id, :resignation_date => er.resignation_date, :reason => er.reason, :notice_period => er.notice_period, :is_notice_period => er.is_notice_period, :short_notice_period => er.short_notice_period, :tentative_leaving_date => er.tentative_leaving_date, :remark => er.remark, :exit_interview_date => er.exit_interview_date, :note => er.note, :leaving_date => er.leaving_date, :settled_on => er.settled_on, :has_left => er.has_left, :notice_served => er.notice_served, :rehired => er.rehired, :resign_status => er.resign_status, :leaving_reason_id => er.leaving_reason.try(:name), :is_stop_pay_request => er.is_stop_pay_request, :second_reporter_id => er.second_reporter_id, :final_reporter_id => er.final_reporter_id, :is_pending => er.is_pending, :is_first_approved => er.is_first_approved, :is_second_approved => er.is_second_approved, :is_final_approved => er.is_final_approved, :is_cancelled => er.is_cancelled, :is_first_rejected => er.is_first_rejected, :is_second_rejected => er.is_second_rejected, :is_final_rejected => er.is_final_rejected, :application_date => er.application_date, :reporting_master_id => er.reporting_master_id }} : []
  end
  
  def first_approved_resignation_requests
    employee_id = params[:employee_id]
    first_approved_resignation_requests = EmployeeResignation.where(is_first_approved: true, is_second_approved: false,is_second_rejected: false, is_cancelled: false,second_reporter_id: employee_id)
    render :json => pending_employee_resignation.present? ? pending_employee_resignation.collect{|er| { :id => er.id, :manual_employee_code => er.try(:employee).try(:manual_employee_code), :prefix => er.try(:employee).try(:prefix), :employee_first_name => er.try(:employee).try(:first_name), :employee_middle_name => er.try(:employee).try(:middle_name), :employee_last_name => er.try(:employee).try(:last_name), :employee_id => er.employee_id, :resignation_date => er.resignation_date, :reason => er.reason, :notice_period => er.notice_period, :is_notice_period => er.is_notice_period, :short_notice_period => er.short_notice_period, :tentative_leaving_date => er.tentative_leaving_date, :remark => er.remark, :exit_interview_date => er.exit_interview_date, :note => er.note, :leaving_date => er.leaving_date, :settled_on => er.settled_on, :has_left => er.has_left, :notice_served => er.notice_served, :rehired => er.rehired, :resign_status => er.resign_status, :leaving_reason_id => er.leaving_reason.try(:name), :is_stop_pay_request => er.is_stop_pay_request, :second_reporter_id => er.second_reporter_id, :final_reporter_id => er.final_reporter_id, :is_pending => er.is_pending, :is_first_approved => er.is_first_approved, :is_second_approved => er.is_second_approved, :is_final_approved => er.is_final_approved, :is_cancelled => er.is_cancelled, :is_first_rejected => er.is_first_rejected, :is_second_rejected => er.is_second_rejected, :is_final_rejected => er.is_final_rejected, :application_date => er.application_date, :reporting_master_id => er.reporting_master_id }} : []
  end
  
  def employee_resignation_first_approve
    emp_resignation_id = params[:emp_resignation_id]
    @leaving_date = params[:leaving_date]
    employee_id = params[:employee_id]
    @employee_resignation = EmployeeResignation.find(emp_resignation_id)
    
    #@leaving_date = params[:leaving_date]
    if @employee_resignation.employee.manager_2_id.nil?
    EmployeeResignation.where(id: @employee_resignation.id).update_all(leaving_date: @leaving_date)
      @employee_resignation.update(is_pending:true,is_first_approved: true,is_second_approved: true,resign_status: "SecondApproved")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "SecondApproved",change_date: Date.today)
      EmployeeResignationMailer.no_second_reporter_approval_email_to_employee(@employee_resignation).deliver_now
    else
      EmployeeResignation.where(id: @employee_resignation.id).update_all(leaving_date: @leaving_date)
      @employee_resignation.update(is_pending:true,is_first_approved: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstApproved",is_second_approved: false,is_second_rejected: false, is_cancelled: false)
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "FirstApproved",change_date: Date.today)
      EmployeeResignationMailer.first_level_approval_email_to_employee(@employee_resignation).deliver_now
      # EmployeeResignationMailer.second_level_request_email_to_reporting_manager(@employee_resignation).deliver_now
    end
    render :status=>200, :json=>{:status=> "Resignation Request Approved Successfully"}
  end

  def employee_resignation_first_reject
    employee_id = params[:employee_id]
    emp_resignation_id = params[:emp_resignation_id]
    @employee_resignation = EmployeeResignation.find(emp_resignation_id)
    if @employee_resignation.employee.manager_2_id.nil?
      @employee_resignation.update(is_pending:false,is_first_rejected: true,is_final_rejected: true,resign_status: "Rejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "Rejected",change_date: Date.today)
      EmployeeResignationMailer.no_second_reporter_reject_email_to_employee(@employee_resignation).deliver_now
    else
       @employee_resignation.update(is_pending:false,is_first_rejected: true,second_reporter_id: @employee_resignation.employee.manager_2_id,resign_status: "FirstRejected")
      ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "FirstRejected",change_date: Date.today)
      EmployeeResignationMailer.first_reject_email_to_employee(@employee_resignation).deliver_now
    end
    render :status=>200, :json=>{:status=> "Resignation Request Rejected Successfully"}
  end

  def final_approval_emp_resignation_list
    employee_resignations = EmployeeResignation.where(resign_status: "SecondApproved")
    render :json => employee_resignations.present? ? employee_resignations.collect{|er| { :id => er.id, :manual_employee_code => er.try(:employee).try(:manual_employee_code), :prefix => er.try(:employee).try(:prefix), :employee_first_name => er.try(:employee).try(:first_name), :employee_middle_name => er.try(:employee).try(:middle_name), :employee_last_name => er.try(:employee).try(:last_name), :employee_id => er.employee_id, :resignation_date => er.resignation_date, :reason => er.reason, :notice_period => er.notice_period, :is_notice_period => er.is_notice_period, :short_notice_period => er.short_notice_period, :tentative_leaving_date => er.tentative_leaving_date, :remark => er.remark, :exit_interview_date => er.exit_interview_date, :note => er.note, :leaving_date => er.leaving_date, :settled_on => er.settled_on, :has_left => er.has_left, :notice_served => er.notice_served, :rehired => er.rehired, :resign_status => er.resign_status, :leaving_reason_id => er.leaving_reason.try(:name), :is_stop_pay_request => er.is_stop_pay_request, :second_reporter_id => er.second_reporter_id, :final_reporter_id => er.final_reporter_id, :is_pending => er.is_pending, :is_first_approved => er.is_first_approved, :is_second_approved => er.is_second_approved, :is_final_approved => er.is_final_approved, :is_cancelled => er.is_cancelled, :is_first_rejected => er.is_first_rejected, :is_second_rejected => er.is_second_rejected, :is_final_rejected => er.is_final_rejected, :application_date => er.application_date, :reporting_master_id => er.reporting_master_id }} : []
  end

  def employee_resignation_final_approve
    @leaving_date = params[:leaving_date]
    @exit_interview_date = params[:exit_interview_date]
    employee_id = params[:employee_id]
    emp_resignation_id = params[:emp_resignation_id]
    @employee_resignation = EmployeeResignation.find(emp_resignation_id)
    EmployeeResignation.where(id: @employee_resignation.id).update_all(exit_interview_date: @exit_interview_date,leaving_date: @leaving_date,settled_on: @settled_on)
    @employee_resignation.update(final_reporter_id: employee_id,is_final_approved: true,resign_status: "FinalApproved")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "FinalApproved",change_date: Date.today)
    EmployeeResignationMailer.final_approval_email_to_employee(@employee_resignation).deliver_now
    if @employee_resignation.resign_status == "FinalApproved"
      render :status=>200, :json=>{:status=> "Resignation Request Approved Successfully"}
    else
      render :status=>200, :json=>{:status=> "Resignation Request Approved Successfully"}
    end
  end

  def employee_resignation_final_reject
    employee_id = params[:employee_id]
    emp_resignation_id = params[:emp_resignation_id]
    @employee_resignation = EmployeeResignation.find(emp_resignation_id)
    @employee_resignation.update(final_reporter_id: employee_id,is_final_rejected: true,resign_status: "FinalRejected")
    ResignationStatusRecord.create(employee_resignation_id: @employee_resignation.id,change_status_employee_id: employee_id,status: "FinalRejected",change_date: Date.today)
    EmployeeResignationMailer.final_reject_email_to_employee(@employee_resignation).deliver_now
    render :status=>200, :json=>{:status=> "Resignation Request Rejected Successfully"}
  end
  
  def all_resignation_requests
    employee_id = params[:employee_id]
    pending_employee_resignation = EmployeeResignation.where(is_pending: true, is_first_approved: false,is_first_rejected: false, is_cancelled: false)
    render :json => pending_employee_resignation.present? ? pending_employee_resignation.collect{|er| { :id => er.id, :manual_employee_code => er.try(:employee).try(:manual_employee_code), :prefix => er.try(:employee).try(:prefix), :employee_first_name => er.try(:employee).try(:first_name), :employee_middle_name => er.try(:employee).try(:middle_name), :employee_last_name => er.try(:employee).try(:last_name), :employee_id => er.employee_id, :resignation_date => er.resignation_date, :reason => er.reason, :notice_period => er.notice_period, :is_notice_period => er.is_notice_period, :short_notice_period => er.short_notice_period, :tentative_leaving_date => er.tentative_leaving_date, :remark => er.remark, :exit_interview_date => er.exit_interview_date, :note => er.note, :leaving_date => er.leaving_date, :settled_on => er.settled_on, :has_left => er.has_left, :notice_served => er.notice_served, :rehired => er.rehired, :resign_status => er.resign_status, :leaving_reason_id => er.leaving_reason.try(:name), :is_stop_pay_request => er.is_stop_pay_request, :second_reporter_id => er.second_reporter_id, :final_reporter_id => er.final_reporter_id, :is_pending => er.is_pending, :is_first_approved => er.is_first_approved, :is_second_approved => er.is_second_approved, :is_final_approved => er.is_final_approved, :is_cancelled => er.is_cancelled, :is_first_rejected => er.is_first_rejected, :is_second_rejected => er.is_second_rejected, :is_final_rejected => er.is_final_rejected, :application_date => er.application_date, :reporting_master_id => er.reporting_master_id }} : []
  end

  def shift_wise_system_base
    employee_id = params[:employee_id]
    joining_detail = JoiningDetail.find_by(employee_id: employee_id)
    shift_time = ShiftTime.where(cost_center_id: joining_detail.cost_center_id).pluck(:id)
    @shift_employees = ShiftEmployee.where(shift_time_id: shift_time).group(:date,:shift_time_id).order("date desc")
    render :json => @shift_employees.present? ? @shift_employees.collect{|sh| { :id => sh.id, :shift_schedule_id => sh.shift_schedule_id, :shift => sh.try(:shift_time).try(:shift), :shift_name => sh.try(:shift_time).try(:name), :employee_id => sh.employee_id, :date => sh.date, :comment => sh.comment, :justification => sh.justification, :status => sh.status, :shift_time_id => sh.shift_time_id, :created_by_id => sh.created_by_id }} : []
  end

  def system_base_attendance
    employee_id = params[:employee_id]
    shift_employee_id = params[:shift_employee_id]
    date = Date.today
    shift_employee = ShiftEmployee.find(params[:shift_employee_id])
    @date = shift_employee.date
    # joining_detail = JoiningDetail.where("joining_date <= ?",@date).pluck(:employee_id)
    @employees = Employee.where(status: "Active").where("manager_id = ? OR manager_2_id = ?", employee_id, employee_id)
    @employee_id = @employees.pluck(:id)
    @shift_employees = ShiftEmployee.where(shift_schedule_id: shift_employee.shift_schedule_id,date: @date,employee_id: @employee_id)
    render :json => @shift_employees.present? ? @shift_employees.collect{|sh| { :id => sh.id, :manual_employee_code => sh.try(:employee).try(:manual_employee_code), :prefix => sh.try(:employee).try(:prefix), :employee_first_name => sh.try(:employee).try(:first_name), :employee_middle_name => sh.try(:employee).try(:middle_name), :employee_last_name => sh.try(:employee).try(:last_name), :shift_schedule_id => sh.shift_schedule_id, :shift => sh.try(:shift_time).try(:shift), :shift_name => sh.try(:shift_time).try(:name), :employee_id => sh.employee_id, :date => sh.date, :comment => sh.comment, :justification => sh.justification, :status => sh.status, :shift_time_id => sh.shift_time_id, :created_by_id => sh.created_by_id, :new_status => EmployeeAttendance.exists?(employee_id: sh.employee.id, day: @date) }} : []
  end

  def attendance_check
    shift_employee = ShiftEmployee.find(params[:shift_employee_id])
    employee  = shift_employee.employee_id
    date =shift_employee.date
    emp_att = EmployeeAttendance.where(employee_id: employee,day: date.to_date)
    # render :json => @employee_attendances.present? ? @employee_attendances.collect{|ea| { :id => ea.id,employee_id: ea.employee_id,in_time: ea.in_time,out_time: ea.out_time }} : []
    if emp_att.present?
      # render :json => emp_att.present? ? emp_att.collect{|emp_att| { :id => emp_att.id, :day => emp_att.day, :in_time => emp_att.try(:in_time).try(:strftime("%I:%M:%S %p")), :out_time => emp_att.try(:out_time).try(:strftime("%I:%M:%S %p")), :working_hrs => emp_att.working_hrs, :present => emp_att.present }} : []
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :day_name => emp_att.try(:day).strftime('%A'), :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time).strftime("%I:%M %p"), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :day_name => emp_att.try(:day).strftime('%A'), :in_time => emp_att.try(:in_time).strftime("%I:%M %p"), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        else
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :day_name => emp_att.try(:day).strftime('%A'), :in_time => emp_att.try(:in_time), :out_time => emp_att.try(:out_time), :working_hrs => emp_att.working_hrs, :present => emp_att.present, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

  def create_systembase_attendance
    shift_employee_id = params[:shift_employee_id]
    time = Time.now
    @time = time.strftime("%H:%M:%S")
    shift_employee = ShiftEmployee.find(params[:shift_employee_id])
    @date = shift_employee.date
    emp = shift_employee.employee_id
    employee = Employee.find_by(id: emp)
    if EmployeeAttendance.exists?(day: @date.to_date,employee_id: employee.id)
      emp_attendance = EmployeeAttendance.where(day: @date.to_date,employee_id: employee.id).take
      total_hrs =  @time.to_time - emp_attendance.try(:in_time)
      working_hrs = Time.at(total_hrs).strftime("%H:%M")
      @employee_attendance = EmployeeAttendance.find_by(id: emp_attendance.id).update(out_time: @time,working_hrs: working_hrs)
    else
      EmployeeAttendance.create(employee_id: employee.id,day: @date.to_date,present: "P",in_time: @time,out_time: @time,count: 1.0,department_id: employee.department_id,comment: "System Base")
    end
    # redirect_to system_base_attendance_manager_self_services_path(shift_employee_id: shift_employee.id)
    # render :status=>200, :json=>{:status=> "Resignation Request Rejected Successfully"}
    render :status=>200, :json=>{:status=>"Attendance Successfully Stored."}
  end

  def view_attendance
    shift_employee = ShiftEmployee.find(params[:format])
    employee = shift_employee.employee.id
    date = shift_employee.date
    emp_att = EmployeeAttendance.where(employee_id: employee,day: date.to_date)
    if emp_att.present?
      render :json => emp_att.present? ? emp_att.collect{|emp_att| 
        if emp_att.in_time.present? and emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        elsif emp_att.in_time.present? and !emp_att.out_time.present?
          { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        else
           { :id => emp_att.id, :manual_employee_code => emp_att.try(:employee).try(:manual_employee_code), :employee_id => emp_att.employee_id, :prefix => emp_att.try(:employee).try(:prefix), :employee_first_name => emp_att.try(:employee).try(:first_name), :employee_middle_name => emp_att.try(:employee).try(:middle_name), :employee_last_name => emp_att.try(:employee).try(:last_name), :day => emp_att.day, :present => emp_att.present, :in_time => emp_att.in_time, :out_time => emp_att.out_time, :employee_leav_request_id => emp_att.employee_leav_request_id, :on_duty_request_id => emp_att.on_duty_request_id, :working_hrs => emp_att.working_hrs, :comment => emp_att.comment }
        end
        } : []
    else
      render :status=>200, :json=>{:status=>"Employee Attendance Not Found."}
    end
  end

end