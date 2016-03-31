module EmployeeGoalsHelper
	def all_goal_perspective_type
		GoalPerspective.all.collect {|x| [x.name,x.id]}
	end
	# def all_goal_measure_type
	# 	GoalMeasure.all.collect {|x| [x.name,x.id]}
	# end
	def all_period_type
		PerformancePeriod.where(is_open: true).collect {|x| [x.title+" "+x.start_date.to_s+" "+x.end_date.to_s,x.id]}
	end
	def employee_list_by_manager_id
		current_login = Employee.find(current_user.employee_id)
		current_login.subordinates.collect {|s| [s.manual_employee_code.to_s+" "+s.first_name.to_s+" "+s.last_name.to_s,s.id]}
	end
end