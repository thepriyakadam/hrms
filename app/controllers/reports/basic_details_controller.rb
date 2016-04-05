class Reports::BasicDetailsController < ApplicationController
  def new

  end

  def employee_basic_report
   @employees = Employee.where(company_location_id: params[:salary][:company_location_id])

  end

end
