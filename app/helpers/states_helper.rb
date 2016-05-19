module StatesHelper
def all_country
    Country.all.collect { |x| [x.name, x.id] }
  end
end
