json.extract! candidate_interview_schedule, :id, :candidate_form_id, :interviewer_id, :interview_type_master_id, :date, :time, :place, :address, :description, :created_at, :updated_at
json.url candidate_interview_schedule_url(candidate_interview_schedule, format: :json)
