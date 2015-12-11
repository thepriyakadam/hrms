json.array!(@employee_designations) do |employee_designation|
  json.extract! employee_designation, :id, :name
  json.url employee_designation_url(employee_designation, format: :json)
end
