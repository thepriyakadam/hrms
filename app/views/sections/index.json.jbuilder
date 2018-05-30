json.array!(@sections) do |section|
  json.extract! section, :id, :code, :description, :status
  json.url section_url(section, format: :json)
end
