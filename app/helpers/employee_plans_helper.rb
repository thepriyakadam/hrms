module EmployeePlansHelper
	def all_plan_reason
	    PlanReasonMaster.all.collect { |x| [x.code+' - '+x.name, x.id] }
  	end

  	def all_plan
	    EmployeePlan.all.collect { |x| [x.code+' - '+x.name, x.id] }
  	end
end
