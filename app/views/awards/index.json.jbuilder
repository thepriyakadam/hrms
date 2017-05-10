json.array!(@awards) do |award|
  json.extract! award, :id, :employee_id, :award_name, :year_id, :award_from
  json.url award_url(award, format: :json)
end
