json.array!(@reserved_categories) do |reserved_category|
  json.extract! reserved_category, :id, :code, :name, :description
  json.url reserved_category_url(reserved_category, format: :json)
end
