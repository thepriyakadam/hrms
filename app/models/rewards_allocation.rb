class RewardsAllocation < ActiveRecord::Base
  belongs_to :reward_type
  belongs_to :department
  belongs_to :reporting_master
end
