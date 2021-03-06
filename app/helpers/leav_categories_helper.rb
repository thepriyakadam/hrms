module LeavCategoriesHelper

  def male_leave_category
    LeavCategory.where(is_active: true).collect { |x| [x.code+' - '+x.name, x.id] unless x.code == "ML" }.compact
  end

  def female_leave_category
    LeavCategory.where(is_active: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end

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

  def leav_category_transfer
    LeavCategory.where(transfer: true).collect { |x| [x.code+' - '+x.name, x.id] }
  end

end
