module DegreesHelper
  def all_degree
    Degree.all.collect { |d| [d.name, d.id] }
  end
  def all_degree_list
    Degree.all.collect { |x| [x.name, x.id] }
 end
end
