module RatingMastersHelper
	def all_rating_type
		RatingMaster.all.collect { |r| [r.code, r.id] }
	end
end
