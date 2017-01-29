class AddNewColumnToSalaryComponents < ActiveRecord::Migration
  def change
    add_column :salary_components, :account_code, :string
  end
end
