class RewardType < ActiveRecord::Base
	has_many :reward_pals
	has_many :rewards_allocations

	validates :code, presence: true,uniqueness: { case_sensitive: false }
	validates :name, presence: true,uniqueness: { case_sensitive: false }
end
