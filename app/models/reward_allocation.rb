class RewardAllocation < ActiveRecord::Base
	belongs_to :reporting_master
	belongs_to :department
	belongs_to :reward_type
end
