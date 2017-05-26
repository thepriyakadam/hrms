module ReligionsHelper
  def all_religions
    Religion.all.collect { |r| [r.name, r.id] }
  end
end
