class AddColToEmployeeTransfers < ActiveRecord::Migration
  def change
  	add_column :employee_transfers, :current_status, :string
  	add_column :transfer_histories, :current_status, :string
  end
end
