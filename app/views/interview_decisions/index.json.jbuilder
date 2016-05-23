json.array!(@interview_decisions) do |interview_decision|
  json.extract! interview_decision, :id, :code, :name, :description
  json.url interview_decision_url(interview_decision, format: :json)
end
