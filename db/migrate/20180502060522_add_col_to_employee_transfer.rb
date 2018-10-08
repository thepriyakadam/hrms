class AddColToEmployeeTransfer < ActiveRecord::Migration
  def change
    add_column :employee_transfers, :from, :date
    add_column :employee_transfers, :to, :date
    add_column :transfer_histories, :from, :date
    add_column :transfer_histories, :to, :date
  end
end
