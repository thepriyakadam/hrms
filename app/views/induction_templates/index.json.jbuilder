json.array!(@induction_templates) do |induction_template|
  json.extract! induction_template, :id, :template_no, :description, :activity, :day, :duration, :employee_id
  json.url induction_template_url(induction_template, format: :json)
end
