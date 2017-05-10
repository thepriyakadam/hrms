module UniversitiesHelper
  def all_university
    University.all.collect { |x| [x.name, x.id] }
  end
end
