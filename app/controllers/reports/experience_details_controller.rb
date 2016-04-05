class Reports::ExperienceDetailsController < ApplicationController
  def new
  end

  def experience_detail_report
  	 @experiences = Experience.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end

end
