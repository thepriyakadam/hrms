class AddCOffHrsInEmployeeLeavBalances < ActiveRecord::Migration
  def change
    add_column :employee_leav_balances, :c_off_hrs, :string
  end
end
