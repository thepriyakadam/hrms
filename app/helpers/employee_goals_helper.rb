module EmployeeGoalsHelper
	def all_goal_perspective_type
		GoalPerspective.all.collect {|x| [x.name,x.id]}
	end
	def all_goal_measure_type
		GoalMeasure.all.collect {|x| [x.name,x.id]}
	end
	def all_period_type
		PerformancePeriod.all.collect {|x| [x.title+" "+x.start_date.to_s+" "+x.end_date.to_s,x.id]}
	end
end