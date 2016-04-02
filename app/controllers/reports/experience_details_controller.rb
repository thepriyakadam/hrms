class Reports::ExperienceDetailsController < ApplicationController
  def new
  end

  def experience_detail_report
  	 @experiences = Experience.all
  end

end
