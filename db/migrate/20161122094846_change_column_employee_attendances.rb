class ChangeColumnEmployeeAttendances < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :in_time, :time
  	change_column :employee_attendances, :out_time, :time
  end
end
