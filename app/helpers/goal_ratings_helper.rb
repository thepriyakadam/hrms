module GoalRatingsHelper
	def all_goal_perspective
		GoalPerspective.all.collect{|g| [g.name,g.id]}
	end
end
