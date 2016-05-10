module TravelRequestsHelper
	def all_travel_request
    TravelRequest.all.collect { |t| [t.name, t.id] }
  end
end
