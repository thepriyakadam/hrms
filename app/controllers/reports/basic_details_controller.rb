class Reports::BasicDetailsController < ApplicationController
  def new

  end

  def employee_basic_report
   @employees = Employee.where(company_location_id: params[:salary][:company_location_id])

  end

  def collect_departments
    @company_location = CompanyLocation.find(params[:id])
    @department = @company_location.departments
   
  end
end
