class ChangeDatatypeEmployeeAttendances < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :difference_hrs, :decimal
  	change_column :employee_attendances, :overtime_hrs, :decimal
  end
end
