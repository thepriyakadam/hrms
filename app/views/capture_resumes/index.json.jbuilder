json.array!(@capture_resumes) do |capture_resume|
  json.extract! capture_resume, :id, :name_of_candidate, :contact_no, :post_applied, :mode_of_application, :date_of_application, :url, :fax, :street, :country, :state, :district, :city, :zip_code, :current_job_title, :current_employeer, :skill_set, :additional_info, :email, :skype_id, :twitter, :current_salary, :expected_salary, :current_location, :notice_period, :interview_date, :interview_time, :reason, :work_experience, :candidate_call_status
  json.url capture_resume_url(capture_resume, format: :json)
end
