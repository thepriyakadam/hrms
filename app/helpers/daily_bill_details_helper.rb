module DailyBillDetailsHelper
	def all_travel_expence_type
	TravelExpenceType.all.collect { |x| [x.name, x.id] }
	end
end
