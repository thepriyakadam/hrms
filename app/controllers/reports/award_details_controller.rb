class Reports::AwardDetailsController < ApplicationController
  def new
  end
  
  def award_detail_report
  	 @awards = Award.all
  end

end
