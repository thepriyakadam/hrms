class EmployeeLeavRequestReportsController < ApplicationController
  def index
    @employee_leav_request_report = EmployeeLeavRequestReport.new(params[:employee_leav_request_report]) do |scope|
      scope.page(params[:page])
    end
  end
end
