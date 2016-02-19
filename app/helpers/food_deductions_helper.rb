module FoodDeductionsHelper
	def all_food_coupan_master
		FoodCoupanMaster.all.collect {|x| [x.name,x.id]}
	end
end
