class AddColToEmployeeLeavBalances < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :expiry_date, :date
    add_column :employee_leav_balances, :total_leave, :string
  end
end
