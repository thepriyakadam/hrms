class Reports::QualificationDetailsController < ApplicationController
  def new
  end

  def qualification_detail_report
  	@qualifications = Qualification.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end
end
