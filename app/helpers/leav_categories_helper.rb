module LeavCategoriesHelper
  def all_leav_category
    LeavCategory.where(is_active: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end

  def all_leav_category_balance
    LeavCategory.where(is_active: true,is_balance: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end

  def cashable_leav_category
    LeavCategory.where(is_cashable: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end

  def assign_leav_category_balance
    LeavCategory.where(is_active: true,is_balance: true,assign_balance: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end
end
