class AddColToEmployeeTransfer < ActiveRecord::Migration
  def change
    add_column :employee_transfers, :effective_from, :date
    add_column :employee_transfers, :effective_to, :date
  end
end
