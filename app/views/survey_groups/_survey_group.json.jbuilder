json.extract! survey_group, :id, :employee_id, :name, :contact, :role, :status, :created_at, :updated_at
json.url survey_group_url(survey_group, format: :json)
