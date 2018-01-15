module SurveyGroupsHelper
	def all_survey_group
    SurveyGroup.where(status: true).all.collect { |x| [x.try(:name), x.id] }
  end
end
