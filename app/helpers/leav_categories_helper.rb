module LeavCategoriesHelper
  def all_leav_category
    LeavCategory.where(is_active: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end
end
