json.array!(@salary_components) do |salary_component|
  json.extract! salary_component, :id, :name, :is_deducted, :code, :description
  json.url salary_component_url(salary_component, format: :json)
end
