module NationalitiesHelper
  def all_nationality
    Nationality.all.collect { |x| [x.name, x.id] }
  end
end
