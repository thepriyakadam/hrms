module GoalRatingsHelper
	def all_goal_perspective
		GoalPerspective.all.collect{|g| [g.name,g.id]}
	end
	def all_attribute_type
		AttributeMaster.all.collect{|a| [a.name,a.id]}
	end
end
