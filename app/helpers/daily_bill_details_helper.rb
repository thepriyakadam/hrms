module DailyBillDetailsHelper
	def all_travel_expence_type
	TravelExpenceType.all.collect { |x| [x.name, x.id] }
	end

	def all_currency
    CurrencyMaster.all.collect {|x| [x.code.to_s + ' - ' + x.description.to_s,x.id]}   
   end
end
