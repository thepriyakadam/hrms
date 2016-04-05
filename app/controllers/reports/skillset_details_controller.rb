class Reports::SkillsetDetailsController < ApplicationController
  def new
  end
  def skillset_detail_report
  	@skillsets = Skillset.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end
end
