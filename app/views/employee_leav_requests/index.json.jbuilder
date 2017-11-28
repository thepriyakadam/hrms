json.array!(@employee_leav_requests) do |employee_leav_request|
  json.extract! employee_leav_request, :id, :employee_id, :leav_category_id, :leave_type, :satrt_date, :end_date
  json.url employee_leav_request_url(employee_leav_request, format: :json)
end
