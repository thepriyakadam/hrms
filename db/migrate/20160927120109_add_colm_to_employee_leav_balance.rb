class AddColmToEmployeeLeavBalance < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :is_active, :boolean
  end
end
