module ReservedCategoriesHelper
  def all_reserved_category
    ReservedCategory.all.collect { |x| [x.name, x.id] }
  end
end
