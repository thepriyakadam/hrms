json.array!(@company_leavs) do |company_leav|
  json.extract! company_leav, :id, :employee_grade_id, :no_of_leave, :expire_date
  json.url company_leav_url(company_leav, format: :json)
end
