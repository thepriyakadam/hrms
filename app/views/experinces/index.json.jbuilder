json.array!(@experinces) do |experince|
  json.extract! experince, :id, :employee_id, :no_of_year_experince, :company_name, :designation, :ctc
  json.url experince_url(experince, format: :json)
end
