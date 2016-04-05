class Reports::AwardDetailsController < ApplicationController
  def new
  end
  
  def award_detail_report
  	 @awards = Award.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end

end
