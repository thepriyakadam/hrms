json.extract! gps_information, :id, :employee_id, :day, :longitude, :latitude, :place, :radius, :created_at, :updated_at
json.url gps_information_url(gps_information, format: :json)
