module EmployeePlansHelper
	def all_plan_reason
	    PlanReasonMaster.all.collect { |x| [x.code+' - '+x.name, x.id] }
  	end

  	def all_plan
	    EmployeePlan.all.collect { |x| [x.code+' - '+x.name, x.id] }
  	end

  	def emp_wise_plan
  		emp_id = current_user.employee_id
  		EmployeePlan.where(employee_id: emp_id).collect { |x| [ x.try(:meeting_with).to_s + '-' + x.try(:location).to_s, x.id ] }
  	end
  	# listed_company_id
end
