json.array!(@leav_requests) do |leav_request|
  json.extract! leav_request, :id, :leav_type_id, :employee_id, :available_leaves, :leave, :date_from, :date_to, :no_of_days, :reason, :applied_on
  json.url leav_request_url(leav_request, format: :json)
end
