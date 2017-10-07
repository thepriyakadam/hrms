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
    render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id,:employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count,:leave_count => elb.leave_count,:collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
  end

  

end