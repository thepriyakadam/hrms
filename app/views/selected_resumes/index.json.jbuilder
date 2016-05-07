json.array!(@selected_resumes) do |selected_resume|
  json.extract! selected_resume, :id, :name, :contact_no, :skillset, :degree_id, :ctc, :email_id, :experience, :notice_period, :vacancy_master_id
  json.url selected_resume_url(selected_resume, format: :json)
end
