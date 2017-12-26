class SurveyDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :survey_question
  belongs_to :answer_master
end
