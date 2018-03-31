module CountriesHelper
  def all_countries
    Country.all.collect { |c| [c.name, c.id] }
  end
  def all_country
    Country.all.collect { |x| [x.name, x.id] }
  end
end
