json.array!(@leav_cancelleds) do |leav_cancelled|
  json.extract! leav_cancelled, :id, :employee_leav_request_id, :cancelled_date
  json.url leav_cancelled_url(leav_cancelled, format: :json)
end
