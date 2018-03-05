class AddColToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_option, :string
  end
end
