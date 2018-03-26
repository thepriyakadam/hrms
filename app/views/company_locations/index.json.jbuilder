json.array!(@company_locations) do |company_location|
  json.extract! company_location, :id, :company_id, :name, :address, :city, :district, :pin_code, :contact_no
  json.url company_location_url(company_location, format: :json)
end
