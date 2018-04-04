json.extract! survey_question, :id, :survey_group_id, :question_code, :question_category, :question, :status, :created_at, :updated_at
json.url survey_question_url(survey_question, format: :json)
