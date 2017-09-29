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
        render :status=>200, :json=>{:status=>"Success"}
      end
    end
  end

  def employee_list
    # if params[:authentication_token].present?
    #   member = Member.find_by_authentication_token(params[:authentication_token])
      # employees = Employee.all if member.present?
      # render :json => employees.collect{|s| {:id => s.id,:first_name => s.first_name} : []
    # else
    #   render :status => 400,
    #          :json => {:status=>"Failure",:message=>"User Id or Authentication Token is required."}
    # end
    employee = params[:id]
    employees = Employee.all 
      render :json => employees.present? ? employees.collect{|s| {:id => s.id,:first_name => s.first_name}} : []
      
      # emp = params[:id]
      # render :json => {emp} : []
      # @employees = Employee.where(:id => @emp)
      # render :json => @employees.present? ? @employees.collect{|s| {:id => s.id,:first_name => s.first_name}} : []
    end


end