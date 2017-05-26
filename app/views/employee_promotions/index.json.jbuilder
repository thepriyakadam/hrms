json.array!(@employee_promotions) do |employee_promotion|
  json.extract! employee_promotion, :id, :employee_id, :department_id, :employee_designation_id, :employee_grade_id, :employee_category_id, :employee_ctc, :justification, :effective_from, :effective_to
  json.url employee_promotion_url(employee_promotion, format: :json)
end
