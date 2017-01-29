module TravelModesHelper
  def all_travel_mode
    TravelMode.all.collect { |x| [x.name, x.id] }
  end
end
