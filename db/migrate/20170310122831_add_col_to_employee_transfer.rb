class AddColToEmployeeTransfer < ActiveRecord::Migration
  def change
    add_column :employee_transfers, :designation, :string
    add_column :employee_transfers, :category, :string
    add_column :employee_transfers, :employee_company, :string
    add_column :employee_transfers, :employee_company_location, :string
    add_column :employee_transfers, :employee_department, :string
  end
end
