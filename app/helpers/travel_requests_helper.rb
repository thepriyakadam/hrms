module TravelRequestsHelper
  def all_travel_request
	TravelRequest.all.collect {|t| [full_name(t.employee),t.id]}
  end
end
