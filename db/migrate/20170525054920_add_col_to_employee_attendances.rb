class AddColToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :employee_code, :integer
    add_column :employee_attendances, :employee_name, :string
  end
end
