json.array!(@states) do |state|
  json.extract! state, :id, :country_id, :code, :name
  json.url state_url(state, format: :json)
end
