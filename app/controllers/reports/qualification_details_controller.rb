class Reports::QualificationDetailsController < ApplicationController
  def new
  end

  def qualification_detail_report
  	@qualifications = Qualification.all
  end
end
