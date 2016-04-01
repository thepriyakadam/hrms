class Reports::FamilyDetailsController < ApplicationController
  def new
  end
  def family_detail_report
  	 @families = Family.all
  end
end
