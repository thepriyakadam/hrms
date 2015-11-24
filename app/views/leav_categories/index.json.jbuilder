json.array!(@leav_categories) do |leav_category|
  json.extract! leav_category, :id, :name
  json.url leav_category_url(leav_category, format: :json)
end
