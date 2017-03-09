class AddColToTransferHistory < ActiveRecord::Migration
  def change
    add_column :transfer_histories, :employee_designation, :string
    add_column :transfer_histories, :employee_category, :string
    add_column :transfer_histories, :company, :string
    add_column :transfer_histories, :company_location, :string
    add_column :transfer_histories, :department, :string
  end
end
