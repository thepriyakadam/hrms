json.array!(@reporting_masters) do |reporting_master|
  json.extract! reporting_master, :id, :code, :name, :description, :employee_id
  json.url reporting_master_url(reporting_master, format: :json)
end
