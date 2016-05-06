json.array!(@nomination_masters) do |nomination_master|
  json.extract! nomination_master, :id, :code, :name, :description
  json.url nomination_master_url(nomination_master, format: :json)
end
