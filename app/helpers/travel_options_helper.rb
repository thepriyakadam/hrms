module TravelOptionsHelper
  def all_travel_option
    TravelOption.all.collect { |x| [x.name, x.id] }
  end
end
