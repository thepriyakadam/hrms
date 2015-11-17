json.array!(@certifications) do |certification|
  json.extract! certification, :id, :qualification_id, :name, :year, :duration, :descripation
  json.url certification_url(certification, format: :json)
end
