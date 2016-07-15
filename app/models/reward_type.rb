class RewardType < ActiveRecord::Base
	has_many :rewards_allocations
end
