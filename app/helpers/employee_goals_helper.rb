module EmployeeGoalsHelper
	def all_goal_perspective_type
		GoalPerspective.all.collect {|x| [x.name,x.id]}
	end
	def all_goal_measure_type
		GoalMeasure.all.collect {|x| [x.name,x.id]}
	end
end
