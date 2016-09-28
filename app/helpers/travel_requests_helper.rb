module TravelRequestsHelper
  def all_travel_request
	TravelRequest.all.collect {|t| [t.id]}
  end
end
