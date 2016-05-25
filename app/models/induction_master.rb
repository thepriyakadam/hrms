class InductionMaster < ActiveRecord::Base
	has_many :induction_activities
	has_many :induction_details
end
