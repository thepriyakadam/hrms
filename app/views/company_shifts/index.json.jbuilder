json.array!(@company_shifts) do |company_shift|
  json.extract! company_shift, :id, :name, :in_time, :out_time
  json.url company_shift_url(company_shift, format: :json)
end
