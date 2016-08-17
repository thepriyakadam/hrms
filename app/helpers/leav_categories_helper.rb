module LeavCategoriesHelper
  def all_leav_category
    LeavCategory.all.collect { |x| [x.name+' - '+x.description, x.id] }
  end
end
