class AddColToEmployeeLeavBalance < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :carry_forward, :string
    add_column :employee_leav_balances, :leave_count, :string
  end
end
