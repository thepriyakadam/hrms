module RatingsHelper
  def all_rating_type
  	Rating.all.collect {|r| [r.value, r.id]}
  end
end
