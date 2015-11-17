json.array!(@skillsets) do |skillset|
  json.extract! skillset, :id, :employee_id, :name, :skill_level
  json.url skillset_url(skillset, format: :json)
end
