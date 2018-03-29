json.array!(@leav_aproveds) do |leav_aproved|
  json.extract! leav_aproved, :id, :employee_leav_request_id, :approved_date
  json.url leav_aproved_url(leav_aproved, format: :json)
end
