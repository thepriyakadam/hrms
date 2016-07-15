json.array!(@reward_allocations) do |reward_allocation|
  json.extract! reward_allocation, :id, :code, :name, :description, :status
  json.url reward_allocation_url(reward_allocation, format: :json)
end
