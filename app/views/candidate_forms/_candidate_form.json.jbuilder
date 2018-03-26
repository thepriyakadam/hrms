json.extract! candidate_form, :id, :vacancy_request_id, :name, :qualification_id, :skill_set, :contact_no, :email, :candidate_type, :experience, :notice_period, :selected_by_id, :created_at, :updated_at
json.url candidate_form_url(candidate_form, format: :json)
