class Reports::PhysicalDetailsController < ApplicationController
  def new
  end
  def physical_detail_report
  	@employee_physicals = EmployeePhysical.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end
end
