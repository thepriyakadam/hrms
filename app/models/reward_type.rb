class RewardType < ActiveRecord::Base
	has_many :reward_pals
	has_many :rewards_allocations
end
