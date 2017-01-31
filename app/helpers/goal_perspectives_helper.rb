module GoalPerspectivesHelper
	def all_goal_perspective
		GoalPerspective.all.collect{|g| [g.name,g.id]}
	end
	def department_wise_goal
		GoalPerspective.where(department_id: current_user.department_id).collect{|g| [g.name,g.id]}
	end
end
