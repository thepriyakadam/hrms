class Reports::FamilyDetailsController < ApplicationController
  def new
  end
  def family_detail_report
  	 @families = Family.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end
end
