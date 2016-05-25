json.array!(@exit_interviews) do |exit_interview|
  json.extract! exit_interview, :id, :employee_id, :question_master_id, :answer
  json.url exit_interview_url(exit_interview, format: :json)
end
