require 'open-uri'
class Api::EmployeeController < ApplicationController
	def index
    if params[:authentication_token].present?
      member = Member.find_by_authentication_token(params[:authentication_token])
      employees = Employee.all if member.present?
      render :json => employees.present? ? employees.collect{|s| {:id => s.id,:image => s.profile_pic.url(:thumb), :first_name => s.first_name, :redirect_url => "/members/#{s.username}"}} : []
    else
      render :status => 400,
             :json => {:status=>"Failure",:message=>"User Id or Authentication Token is required."}
    end
	end
end