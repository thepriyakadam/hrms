class RewardsAllocation < ActiveRecord::Base
  belongs_to :reward_type
  belongs_to :department
  belongs_to :reporting_master
  
	validates :reward_type_id, presence: true
	validates :department_id, presence: true
	validates :reporting_master_id, presence: true
	validates :allocated_qty, presence: true
end
