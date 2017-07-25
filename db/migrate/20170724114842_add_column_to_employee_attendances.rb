class AddColumnToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :employee_name, :string
    add_column :employee_attendances, :employee_code, :string
  end
end
