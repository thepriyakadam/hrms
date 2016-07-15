json.array!(@rewards_allocations) do |rewards_allocation|
  json.extract! rewards_allocation, :id, :reward_type_id, :department_id, :reporting_master_id, :from, :to, :allocated_qty, :cost
  json.url rewards_allocation_url(rewards_allocation, format: :json)
end
