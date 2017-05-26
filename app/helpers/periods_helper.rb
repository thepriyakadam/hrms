module PeriodsHelper
	def all_period_type
		Period.where(status: true).collect { |p| [p.name.to_s+' '+p.from.to_s+' '+p.to.to_s, p.id]}
	end
	def all_period_type
		Period.where(status: true).collect {|p| [p.name, p.id]}
	end
end
