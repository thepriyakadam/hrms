json.array!(@leav_rejecteds) do |leav_rejected|
  json.extract! leav_rejected, :id, :employee_leav_request_id, :rejected_date
  json.url leav_rejected_url(leav_rejected, format: :json)
end
