json.array!(@interview_schedules) do |interview_schedule|
  json.extract! interview_schedule, :id, :interviewer_name, :candidate_name, :interview_date, :interview_time, :location, :schedule_comments, :post_title, :interview_type, :interview_status
  json.url interview_schedule_url(interview_schedule, format: :json)
end
