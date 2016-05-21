json.array!(@interview_attributes) do |interview_attribute|
  json.extract! interview_attribute, :id, :code, :name, :description
  json.url interview_attribute_url(interview_attribute, format: :json)
end
