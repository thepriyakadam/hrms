module DegreesHelper
  def all_degree
    Degree.all.collect { |d| [d.name, d.id] }
  end
end
