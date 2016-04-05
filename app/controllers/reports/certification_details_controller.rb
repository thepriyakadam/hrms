class Reports::CertificationDetailsController < ApplicationController
  def new
  end

  def certification_detail_report
   @certifications = Certification.where(employee_id: Employee.where(company_location_id: params[:salary][:company_location_id]))
  end

end
