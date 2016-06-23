module PerformanceCalendarsHelper
	def all_period_type
		Period.all.collect {|p| [p.name, p.id]}
	end

	def all_activity_type
		PerformanceActivity.all.collect {|a| [a.name,a.id]}
	end
end
