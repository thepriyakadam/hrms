class Reports::JoiningDetailsController < ApplicationController
  
  def new
  end

  def joining_detail_report
 	  @joining_details = JoiningDetail.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]), department_id: params[:department][:department_id])
  end

  def collect_departments
    @company_location = CompanyLocation.find(params[:id])
    @departments = @company_location.departments
  end

end
