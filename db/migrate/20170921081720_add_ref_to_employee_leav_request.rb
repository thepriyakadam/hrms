class AddRefToEmployeeLeavRequest < ActiveRecord::Migration
  def change
     add_reference :vacancy_masters, :employee_leav_balance, index: true, foreign_key: true
  end
end
