class RewardsPal < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reward_type
  belongs_to :reporting_master
end
