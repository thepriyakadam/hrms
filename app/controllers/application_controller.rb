class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate!
  before_action :check_subdomain
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  helper_method :user_signed_in?
  helper_method :current_user
  include LocalSubdomain

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Sorry! You are not Authorized"
    redirect_to root_url
  end
  
  def check_subdomain
    if group_signed_in?
      unless request.subdomain == current_user.subdomain
        flash[:alert] =  "You are not authorized to access that subdomain."
        redirect_to root_url(:subdomain => current_user.subdomain)
      end
    elsif member_signed_in?
      unless request.subdomain == Apartment::Tenant.current_tenant
        flash[:alert] =  "You are not authorized to access that subdomain."
        redirect_to root_url(:subdomain => current_user.subdomain)
      end
    else
      #redirect_to root_url(:subdomain => '')
    end
  end

  def after_sign_in_path_for(resource)
    if resource.class == "Group"
      root_url(:subdomain => current_user.subdomain)
    else
      root_url
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    #root_path
    root_url(:subdomain => '')
  end

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

  protected

  def configure_devise_permitted_parameters
    registration_params = [:subdomain, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
