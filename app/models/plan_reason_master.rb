class PlanReasonMaster < ActiveRecord::Base
	has_many :employee_plans
end
