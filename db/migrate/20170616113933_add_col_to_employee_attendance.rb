class AddColToEmployeeAttendance < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :comment, :string
  end
end
