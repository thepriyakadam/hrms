class Reports::JoiningDetailsController < ApplicationController
  
  def new
  end

   def joining_detail_report
 	@joining_details = JoiningDetail.all
  end

end
