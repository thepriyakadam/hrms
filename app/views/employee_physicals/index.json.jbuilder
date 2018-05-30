json.array!(@employee_physicals) do |employee_physical|
  json.extract! employee_physical, :id, :employee_id, :hieght, :weight, :size
  json.url employee_physical_url(employee_physical, format: :json)
end
