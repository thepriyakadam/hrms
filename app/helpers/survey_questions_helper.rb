module SurveyQuestionsHelper
	def all_survey_questions
    	SurveyQuestion.where(status: true).all.collect { |x| [x.question, x.id] }
  	end
end
