json.array!(@food_coupan_masters) do |food_coupan_master|
  json.extract! food_coupan_master, :id, :code, :name, :description, :price
  json.url food_coupan_master_url(food_coupan_master, format: :json)
end
