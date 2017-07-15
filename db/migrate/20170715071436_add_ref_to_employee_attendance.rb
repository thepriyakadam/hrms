class AddRefToEmployeeAttendance < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :holiday, index: true, foreign_key: true
  end
end
