class AddColmToEmployeeLeavBalances < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :is_confirm, :boolean
  end
end
