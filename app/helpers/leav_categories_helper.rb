module LeavCategoriesHelper
	def all_leav_category
		LeavCategory.all.collect {|x| [x.name, x.id]}
		
	end
end
