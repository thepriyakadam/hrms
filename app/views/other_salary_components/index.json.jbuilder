json.array!(@other_salary_components) do |other_salary_component|
  json.extract! other_salary_component, :id, :code, :name, :description, :is_deducted
  json.url other_salary_component_url(other_salary_component, format: :json)
end
