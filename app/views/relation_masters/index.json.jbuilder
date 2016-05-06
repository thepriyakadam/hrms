json.array!(@relation_masters) do |relation_master|
  json.extract! relation_master, :id, :code, :name, :description
  json.url relation_master_url(relation_master, format: :json)
end
