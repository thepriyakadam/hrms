json.array!(@interview_evalutions) do |interview_evalution|
  json.extract! interview_evalution, :id, :code, :name, :description
  json.url interview_evalution_url(interview_evalution, format: :json)
end
