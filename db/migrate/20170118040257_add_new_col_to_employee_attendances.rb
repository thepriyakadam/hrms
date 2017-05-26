class AddNewColToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :late_mark, :boolean
  end
end
