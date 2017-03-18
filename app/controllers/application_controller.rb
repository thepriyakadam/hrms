require 'open-uri'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate! #, exept: :salaryslip_components.xml
  # before_action :check_subdomain
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  helper_method :user_signed_in?
  helper_method :current_user
  # include LocalSubdomain

  def after_sign_in_path_for(resource)
    # binding.pry
    if resource.class == 'Group'
      # root_url(:subdomain => current_user.subdomain)
      root_url
    else
      root_url
    end
  end

  rescue_from CanCan::AccessDenied do |_exception|
    if request.xhr?
      render js: "alert('Sorry, You are not authorized.');"
    else
      flash[:alert] = 'Sorry! You are not Authorized.'
      redirect_to root_url
    end
  end

  rescue_from SocketError do |e|
    flash[:alert] = "Check Your Internet Connection!"
    redirect_to root_url
  end

  # rescue SocketError => e
  #   flash[:success] = "Vendor Added Successfully mail is not send"
  #   redirect_to amain_path
  # end

  # rescue_from ActiveRecord::RecordNotFound do |_exc|
  #   if request.xhr?
  #     render js: "alert('Sorry! Record not found');"
  #   else
  #     flash[:alert] = 'Sorry! Record not found'
  #     #redirect_to root_url
  #     prev = Rails.application.routes.recognize_path(request.referrer)
  #     puts prev
  #     puts "-------------------------"
  #     puts params
  #     redirect_to url_for(:controller => prev[:controller], :action => prev[:action_name], :id => 1)
  #   end
  # end

  # rescue_from ActiveRecord::ActiveRecordError do |_exc|
  #   if request.xhr?
  #     render js: "alert('Sorry! Record Error');"
  #   else
  #     flash[:alert] = 'Sorry! Record Error'
  #     redirect_to root_url
  #   end
  # end

  rescue_from ActiveRecord::RecordInvalid do |_exc|
    if request.xhr?
      render js: "alert('Sorry! Transaction Rollbacked Record Invalid');"
    else
      flash[:alert] = 'Sorry! Transaction Rollbacked Record Invalid'
      redirect_to root_url
    end
  end

  # rescue_from ActionView::Template::Error do |exc|
  #   if request.xhr?
  #     render js: "alert('Sorry! Template error problem');"
  #   else
  #     flash[:alert] = "Sorry! Template error problem"
  #     redirect_to root_url
  #   end
  # end

  # rescue_from Exception do |exc|
  #   if request.xhr?
  #     render js: "alert('Sorry! Something is wrong.');"
  #   else
  #     flash[:alert] = "Sorry! Something is wrong."
  #     redirect_to root_url
  #   end
  # end

  # AbstractController::ActionNotFound
  # ActionController::RoutingError
  # SQLite3::BusyException
  # ActiveRecord::StatementInvalid
  # ActiveRecord::RecordInvalid
  # AbstractController::DoubleRenderError
  # AbstractController::DoubleRenderError
  # ActionController::ActionControllerError
  # ActionController::InvalidAuthenticityToken

  # def check_subdomain
  #   if group_signed_in?
  #     unless request.subdomain == current_user.subdomain
  #       flash[:alert] =  "You are not authorized to access that subdomain."
  #       redirect_to root_url(:subdomain => current_user.subdomain)
  #     end
  #   elsif member_signed_in?
  #     unless request.subdomain == current_user.subdomain
  #       flash[:alert] =  "You are not authorized to access that subdomain."
  #       redirect_to root_url(:subdomain => current_user.subdomain)
  #     end
  #   else
  #     #redirect_to root_url(:subdomain => '')
  #   end
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   #root_path
  #   root_url(:subdomain => '')
  # end

  # def after_sign_up_path_for(resource)
  #   root_url(:subdomain => resource.subdomain)
  # end

  def authenticate!
    if group_signed_in?
      authenticate_group!
    else
      authenticate_member!
    end
  end

  def current_user
    if group_signed_in?
      current_group
    elsif member_signed_in?
      current_member
    end
  end

  def user_signed_in?
    if group_signed_in?
      true
    elsif member_signed_in?
      true
    else
      false
    end
  end

  def internet_connection?
    begin
      true if open("http://www.google.com/")
    rescue
      false
    end
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:subdomain, :email, :password, :password_confirmation]
    if params[:action] == 'update'
      #devise_parameter_sanitizer.for(:account_update) do |u|
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(registration_params << :current_password, :avatar)
      end
    elsif params[:action] == 'create'
      #devise_parameter_sanitizer.for(:sign_up) do |u|
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(registration_params)
      end
    end

    if params[:controller] == 'members/sessions' && params[:action] == 'new'
      # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :member_code, :email, :password, :remember_me) }
      #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :manual_member_code, :email, :password, :remember_me) }
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :manual_member_code, :email, :password, :remember_me])
    else
     #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    end
  end
end