json.array!(@travel_requests) do |travel_request|
  json.extract! travel_request, :id, :employee_id, :reporting_manager_id, :application_date, :traveling_date, :tour_purpose, :place, :traveling_advance, :lodging_boarding_advance, :extra_advance, :total_advance
  json.url travel_request_url(travel_request, format: :json)
end
