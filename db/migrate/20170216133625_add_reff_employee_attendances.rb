class AddReffEmployeeAttendances < ActiveRecord::Migration
  def change
  	remove_column :employee_attendances, :machine_attendances_id, :integer
  	add_reference :employee_attendances, :machine_attendance, index: true, foreign_key: true
  end
end
