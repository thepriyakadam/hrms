class AddReffToEmployeeAttendance < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :week_off_master, index: true, foreign_key: true
  end
end
