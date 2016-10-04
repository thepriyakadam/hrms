class AddColToEmployeeLeavBalance < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :from_date, :date
    add_column :employee_leav_balances, :to_date, :date
  end
end
