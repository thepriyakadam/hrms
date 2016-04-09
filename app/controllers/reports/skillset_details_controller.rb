class Reports::SkillsetDetailsController < ApplicationController
  def new
  end
  
  def skillset_detail_report
  	@skillsets = Skillset.all
  end
end
