class AddNewColumnToEmployeeResignations < ActiveRecord::Migration
  def change
    add_column :employee_resignations, :resign_status, :string
  end
end
