module TravelRequestsHelper
  def all_travel_request
	TravelRequest.all.collect {|t| [t.employee.first_name.to_s + '   -   ' + t.traveling_date.to_s +   ' to '   + t.to.to_s ,t.id]}
  end
end
