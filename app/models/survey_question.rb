class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey_group
end
