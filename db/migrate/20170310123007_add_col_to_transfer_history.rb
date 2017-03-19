class AddColToTransferHistory < ActiveRecord::Migration
  def change
    add_column :transfer_histories, :designation, :string
    add_column :transfer_histories, :category, :string
    add_column :transfer_histories, :employee_company, :string
    add_column :transfer_histories, :employee_company_location, :string
    add_column :transfer_histories, :employee_department, :string
  end
end
