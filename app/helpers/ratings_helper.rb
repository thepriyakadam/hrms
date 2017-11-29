module RatingsHelper
  def all_rating_type
  	Rating.where(status: true).collect {|r| [r.value, r.id]}
  end
end
