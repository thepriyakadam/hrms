json.array!(@reward_owners) do |reward_owner|
  json.extract! reward_owner, :id, :code, :name, :description, :status
  json.url reward_owner_url(reward_owner, format: :json)
end
