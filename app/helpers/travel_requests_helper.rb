module TravelRequestsHelper
 
 def all_travel_option
    TravelOption.all.collect { |x| [x.name, x.id] }
  end

  def all_travel_mode
    TravelMode.all.collect { |x| [x.name, x.id] }
  end
	
end
