json.array!(@departments) do |department|
  json.extract! department, :id, :company_location_id, :name, :department_type, :address, :pin_code, :head_of_department, :contact_no, :manager, :hr
  json.url department_url(department, format: :json)
end
