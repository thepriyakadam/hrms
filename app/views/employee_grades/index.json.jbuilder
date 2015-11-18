json.array!(@employee_grades) do |employee_grade|
  json.extract! employee_grade, :id, :name
  json.url employee_grade_url(employee_grade, format: :json)
end
