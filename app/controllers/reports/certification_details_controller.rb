class Reports::CertificationDetailsController < ApplicationController
  def new
  end

  def certification_detail_report
   @certifications = Certification.all
  end

end
