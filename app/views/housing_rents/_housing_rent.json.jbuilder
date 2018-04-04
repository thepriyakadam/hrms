json.extract! housing_rent, :id, :investment_declaration_id, :metro_city, :estimated_rent, :actual_rent, :accepted_rent, :rejected_rent, :landlord_name, :landlord_pan_no, :address, :created_at, :updated_at
json.url housing_rent_url(housing_rent, format: :json)
