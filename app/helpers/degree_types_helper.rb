module DegreeTypesHelper
  def all_degree_type
    DegreeType.all.collect { |x| [x.name, x.id] }
  end
end
