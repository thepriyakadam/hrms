json.array!(@employee_categories) do |employee_category|
  json.extract! employee_category, :id, :code, :name, :description
  json.url employee_category_url(employee_category, format: :json)
end
