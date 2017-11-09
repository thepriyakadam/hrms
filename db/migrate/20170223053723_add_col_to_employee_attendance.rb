class AddColToEmployeeAttendance < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :on_duty_request, index: true, foreign_key: true
  end
end
