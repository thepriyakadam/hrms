module YearsHelper
  def all_year
    Year.all.collect { |x| [x.name, x.id] }
  end
end
