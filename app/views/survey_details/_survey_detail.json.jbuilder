json.extract! survey_detail, :id, :employee_id, :survey_question_id, :answer_master_id, :created_at, :updated_at
json.url survey_detail_url(survey_detail, format: :json)
