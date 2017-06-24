json.extract! vacancy_request, :id, :vacancy, :no_of_position, :description, :request_by_id, :approval_by_id, :request_date, :qualification, :skill_set, :designation_id, :department_id, :experience, :current_status, :vacancy_type, :created_at, :updated_at
json.url vacancy_request_url(vacancy_request, format: :json)
