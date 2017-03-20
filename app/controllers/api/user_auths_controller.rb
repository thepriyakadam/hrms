class Api::UserAuthsController < ApplicationController
	skip_before_action :load_filter
	skip_before_action :authenticate!
	include ActionController::MimeResponds
	include ActionController::Cookies
	include ActionView::Helpers::DateHelper
	include ApplicationHelper
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

end
