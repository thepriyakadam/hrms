class ChangeDattypeEmployeeAttendances < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :late_mark, :decimal
  end
end
