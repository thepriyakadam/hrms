module BonusEmployeesHelper
  def bonus_total(b)
    BonusEmployee.where(employee_id: b.employee_id).sum(:amount).to_i
  end
end
