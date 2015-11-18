json.array!(@leav_types) do |leav_type|
  json.extract! leav_type, :id, :leave_type, :no_of_leave, :leave_expiry_date
  json.url leav_type_url(leav_type, format: :json)
end
