class AddColToEmployeeTransfer < ActiveRecord::Migration
  def change
    add_column :employee_transfers, :employee_designation, :string
    add_column :employee_transfers, :employee_category, :string
    add_column :employee_transfers, :company, :string
    add_column :employee_transfers, :company_location, :string
    add_column :employee_transfers, :department, :string
  end
end
