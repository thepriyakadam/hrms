class InductionMaster < ActiveRecord::Base
	has_many :induction_activities
	has_many :induction_details
	validates :code, presence: true,  uniqueness: { case_sensitive: false }
end
