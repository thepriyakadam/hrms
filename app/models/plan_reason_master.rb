class PlanReasonMaster < ActiveRecord::Base
	# belong_to: employee_plan
	has_many :employee_plans
end
