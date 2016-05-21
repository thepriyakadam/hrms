json.array!(@interview_analyses) do |interview_analysis|
  json.extract! interview_analysis, :id, :vacancy_request_history_id, :interview_evalution_id, :interview_attribute_id, :interview_decision_id, :comment
  json.url interview_analysis_url(interview_analysis, format: :json)
end
