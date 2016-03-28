require 'query_report/helper'  #need to require the helper
class EmployeeLeavRequestReportsController < ApplicationController
	load_and_authorize_resource
	include QueryReport::Helper  #need to include it

  def index
    @employee_leav_request_report = EmployeeLeavRequestReport.new(params[:employee_leav_request_report]) do |scope|
      scope.page(params[:page])
    end
  end
  
  def employee_leav_request_reports
    
  end

end

