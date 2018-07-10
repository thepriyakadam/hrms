json.extract! food_option, :id, :travel_option_id, :code, :name, :description, :amount, :is_optional, :status, :created_at, :updated_at
json.url food_option_url(food_option, format: :json)