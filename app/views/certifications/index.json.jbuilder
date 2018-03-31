json.array!(@certifications) do |certification|
  json.extract! certification, :id, :qualification_id, :name, :year_id, :duration, :descripation
  json.url certification_url(certification, format: :json)
end
