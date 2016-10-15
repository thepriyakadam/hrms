class RemoveColFromEmployeeLeavBalance < ActiveRecord::Migration
  def change
  	remove_column :employee_leav_balances, :is_limited, :boolean
  	remove_column :employee_leav_balances, :limit, :string
  end
end
