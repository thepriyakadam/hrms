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
    @user = Member.find_by_email(email.downcase)
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
        render :status=>200, :json=>@user.employee_id
      end
    end
  end

  def employee_list
    @employee = params[:employee_id]
    employees = Employee.where(id: @employee) 
      render :json => employees.present? ? employees.collect{|e| {:id => e.id,:manual_employee_code => e.manual_employee_code,:first_name => e.first_name,:middle_name => e.middle_name,:last_name => e.last_name,:date_of_birth => e.date_of_birth,
      :gender => e.gender,:contact_no => e.contact_no,:optinal_contact_no => e.optinal_contact_no,:optinal_contact_no1 => e.optinal_contact_no1,:email => e.email,:optional_email => e.optional_email,:permanent_address => e.permanent_address,:country_id => e.country_id,:state_id => e.state_id,:district_id => e.district_id,:city => e.city,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:licence_no => e.licence_no,:marital_status => e.marital_status,:blood_group_id => e.blood_group_id,:employee_type_id => e.employee_type_id,:nationality_id => e.nationality_id,:religion_id => e.religion_id,:handicap => e.handicap,:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.company_id,:company_location_id => e.company_location_id,:department_id => e.department_id,:sub_department_id => e.sub_department_id,:extension_no => e.extension_no,:emergency_contact_no => e.emergency_contact_no}} : []
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
      render :json => leave_list.present? ? leave_list.collect{|ll| { :id => ll.id, :employee_id => ll.employee_id, :leav_category_initial => ll.leav_category.try(:code), :leav_category_id => ll.leav_category.try(:name), :leave_type => ll.leave_type, :start_date => ll.start_date, :end_date => ll.end_date, :reason=> ll.reason, :current_status=> ll.current_status, :no_of_day => ll.leave_count }} : []
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end

  def leave_approval_list
    employee_id = params[:employee_id].to_i
    if employee_id.present?
      # if EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false).where("first_reporter_id = ? OR second_reporter_id = ?", "#{employee_id}", "#{employee_id}").last.first_reporter_id = employee_id
        # EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false)
        # lev = EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false).where("first_reporter_id = ? OR second_reporter_id = ?", "#{employee_id}", "#{employee_id}").last.first_reporter_id = employee_id
        # leave_approval =  EmployeeLeavRequest.where(is_pending: true, is_first_approved: false, is_first_rejected: false, is_cancelled: false).where("first_reporter_id = ? OR second_reporter_id = ?", "#{employee_id}", "#{employee_id}")
      # else
        leave_approval = EmployeeLeavRequest.where(is_first_approved: true, is_second_approved: false, is_second_rejected: false, is_cancelled: false).where("first_reporter_id = ? OR second_reporter_id = ?", "#{employee_id}", "#{employee_id}")
      # end 
      render :json => leave_approval.present? ? leave_approval.collect{|lal| {:manual_employee_code => lal.employee.manual_employee_code, :employee_last_name => lal.employee.last_name, :employee_first_name => lal.employee.first_name, :leave_requests_id => lal.id, :employee_id => lal.employee.id }} : []
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
    if @employee_leav_request.current_status = "Pending"
      if @employee_leav_request.employee.manager_2_id.nil?
        @leave_status = LeaveStatusRecord.new do |s|
          s.employee_leav_request_id = employee_leav_request
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
            if @employee_leav_request.first_reporter_id == current_user.employee_id
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
        render :status=>200, :json=>{:status=>"Please Fill mendatory Fields"}
      else#end_date == nil
        if start_date.to_date >= payroll_period.from.to_date && start_date.to_date <= payroll_period.to.to_date
          @leave_c_off_id = params[:c_off_date]
          @leave_c_off = LeaveCOff.find_by(id: @leave_c_off_id)
          if start_date.to_date > @leave_c_off.c_off_date.to_date
            if @leave_c_off.expiry_date < start_date.to_date
              # flash[:alert] = "Compensatory off expired for this day"
              render :status=>200, :json=>{:status=>"Compensatory off expired for this day"}
            elsif @leave_c_off.c_off_date > start_date.to_date
              # flash[:alert] = "Please check Compensatory off day"
              render :status=>200, :json=>{:status=>"Please check Compensatory off day"}
            elsif @employee_leav_request.is_available_coff?
              # flash[:alert] = "Your Leave Request already has been sent"
              render :status=>200, :json=>{:status=>"Your Leave Request already has been sent"}
            elsif @employee_leav_request.is_salary_processed_coff?
              # flash[:alert] = "Salary Processed for this month"
              render :status=>200, :json=>{:status=>"Salary Processed for this month"}
              
            elsif Employee.find_by_id(@employee).manager_id.nil?
              # flash[:alert] = 'Reporting manager not set please set Reporting Manager'
              render :status=>200, :json=>{:status=>"Reporting manager not set please set Reporting Manager"}
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
                render :status=>200, :json=>{:status=>"Created successfully!"}
                LeaveRequestMailer.pending(@employee_leav_request).deliver_now
            end
          else
            # flash[:alert] = "C.Off Not Available For #{@form_date}"
            render :status=>200, :json=>{:status=>"C.Off Not Available For #{@form_date}"}
          end#c_off_date
        else
          # flash[:alert] = "Please Select Date Within Payroll Period"
          render :status=>200, :json=>{:status=>"Please Select Date Within Payroll Period"}
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
        render :status=>200, :json=>{:status=>"Payroll Period Not set!"}
        # redirect_to hr_view_request_employee_leav_requests_path(@employee)
      else
        if start_date == "" || end_date == ""
          # flash[:alert] = "Please fill all mandatory fields "
          render :status=>200, :json=>{:status=>"Please fill all mandatory fields "}
          # redirect_to hr_view_request_employee_leav_requests_path(@employee)
        else
          if start_date.to_date >= payroll_period.from.to_date && end_date.to_date <= payroll_period.to.to_date
            if @employee_leav_request.end_date == nil 
              # flash[:alert] = "please Fill all mendatory fields"
              render :status=>200, :json=>{:status=>"please Fill all mendatory fields"}
              # redirect_to new_employee_leav_request_path
            elsif @employee_leav_request.is_available?
              # flash[:alert] = "Your Leave Request already has been sent status is Pending"
              render :status=>200, :json=>{:status=>"Your Leave Request already has been sent status is Pending"}
              # redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_first_approved?
              #flash[:alert] = "Your Leave Request already has been sent status is First Approved"
              render :status=>200, :json=>{:status=>"Your Leave Request already has been sent status is First Approved"}
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_final_approved?
              # flash[:alert] = "Request already has Approved"
              render :status=>200, :json=>{:status=>"Request already has Approved"}
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif @employee_leav_request.is_salary_processed?
              # flash[:alert] = "Attendance Confirm Please Contact to Admin"
              render :status=>200, :json=>{:status=>"Attendance Confirm Please Contact to Admin"}
              #redirect_to hr_view_request_employee_leav_requests_path(@employee)
            # elsif @employee_leav_request.is_continue?
            #   flash[:alert] = "Leave Can't take continueously"
                render :status=>200, :json=>{:status=>"Leave Can't take continueously"}
            #   redirect_to hr_view_request_employee_leav_requests_path(@employee)
            elsif Employee.find(@employee).nil?
              # flash[:alert] = 'Reporting manager not set please set Reporting Manager'
                render :status=>200, :json=>{:status=>"Reporting manager not set please set Reporting Manager"}
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
                  render :status=>200, :json=>{:status=>"Send request is Pending..!"}
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
                  render :status=>200, :json=>{:status=>"Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"}
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)lash[:alert] = "Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}" 
                  # render :status=>200, :json=>{:status=>"Leave Range for #{@leav_category.code} is #{@leav_category.from} - #{@leav_category.to}"}
                  # redirect_to hr_view_request_employee_leav_requests_path(@employee.id)
              else
                @leave_category = LeavCategory.where(id: @employee_leav_request.leav_category_id, is_active: true).take
                if @leave_category.is_balance == true
                  if @emp_leave_bal.nil?
                    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee)
                    # flash.now[:alert] = 'Leave balance not set- contact to admin.'
                    render :status=>200, :json=>{:status=>"Leave balance not set- contact to admin."}
                    # render :new
                  elsif @employee_leav_request.leave_count.to_f > @emp_leave_bal.try(:no_of_leave).to_f
                    @total_leaves = EmployeeLeavBalance.where('employee_id = ?', @employee)
                    # flash.now[:alert] = 'Not Allowed. You exceed the leave limit.'
                    render :status=>200, :json=>{:status=>"Not Allowed. You exceed the leave limit."}
                    # render :new
                  elsif @employee_leav_request.try(:start_date).try(:to_date) < @emp_leave_bal.try(:from_date).try(:to_date)
                    
                    @emp_leave_bal1 =  EmployeeLeavBalance.where(employee_id: @employee, leav_category_id: @employee_leav_request.leav_category_id,is_active: false).last
                    if @employee_leav_request.leave_count.to_f > @emp_leave_bal1.try(:no_of_leave).to_f
                      # flash[:alert] = 'You Have No Balance For This Date'
                      render :status=>200, :json=>{:status=>"You Have No Balance For This Date"}
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
                    render :new
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
                  render :new
                end
              end #@leave_category.is_balance == true
            end #monthly_count > @leav_category.monthly_leave.to_f
          end #@employee_leav_request.end_date == nil 

          # binding.pry
          # byebug
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
     # render :status=>200, :json=>{:status=>"Success"}
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
    lat = params[:lat]
    lng = params[:lng]
    conform = params[:conform]
    status = params[:status]
    current_status = params[:current_status]
    manager_id = params[:manager].to_i

    employee_plan = EmployeePlan.new(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, lat: lat, lng: lng, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
    if employee_plan.save
      render :status=>200, :json=>{:status=>"Employee plan was successfully created"}
    else
      render :status=>200, :json=>{:status=>"Employee is not Found."}
    end
  end

  def employee_plan_list
    employee_id = params[:employee_id].to_i
    date = params[:date]
    employee_plan = EmployeePlan.where(employee_id).where("? BETWEEN from_date AND from_date", date)
    render :json => employee_plan.present? ? employee_plan.collect{|epl| {:id => epl.id, :employee_id => epl.employee_id,:from_date => epl.from_date, :to_date => epl.to_date, :from_time => epl.from_time, :to_time => epl.to_time, :meeting_with => epl.meeting_with, :location => epl.location, :meeting_agenda => epl.meeting_agenda, :lat => epl.lat, :lng => epl.lng, :conform => epl.conform, :status => epl.status, :current_status => epl.current_status, :manager_id => epl.manager_id  }} : []
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
    lat = params[:lat]
    lng = params[:lng]
    conform = params[:conform]
    status = params[:status]
    current_status = params[:current_status]
    manager_id = params[:manager].to_i
    plan_id = params[:plan_id].to_i
    @employee_plan = EmployeePlan.find(plan_id)
    updated_plan = @employee_plan.update(employee_id: employee_id, from_date: from_date, to_date: to_date, from_time: from_time, to_time: to_time, meeting_with: meeting_with, location: location, meeting_agenda: meeting_agenda, lat: lat, lng: lng, conform: conform, status: status, current_status: current_status, manager_id: manager_id)
    render :status=>200, :json=>{:status=>"Employee plan was successfully updated."}
  end

  def destroy_employee_plan
    plan_id = params[:plan_id]
    @employee_plan = EmployeePlan.find(plan_id)
    @employee_plan.destroy
    render :status=>200, :json=>{:status=>"Employee plan was successfully destroyed."}
  end
end