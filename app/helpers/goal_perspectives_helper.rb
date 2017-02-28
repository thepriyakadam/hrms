module GoalPerspectivesHelper
	def all_goal_perspective
		GoalPerspective.where(status: true).collect{|g| [g.name.to_s+ ' ( Weightage : '+g.try(:from).to_s+ ' to '+g.try(:to).to_s+')',g.id]}
	end
	def department_wise_goal
		GoalPerspective.where(department_id: current_user.department_id).collect{|g| [g.name,g.id]}
	end
end