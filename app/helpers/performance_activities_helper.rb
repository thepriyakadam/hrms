module PerformanceActivitiesHelper
	def all_activity_type
		PerformanceActivity.all.collect {|a| [a.name,a.id]}
	end
end
