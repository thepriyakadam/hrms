json.array!(@accident_masters) do |accident_master|
  json.extract! accident_master, :id, :code, :name, :description
  json.url accident_master_url(accident_master, format: :json)
end
