class AddColToEmployeeAttendance < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :employee_week_off, index: true, foreign_key: true
  end
end
