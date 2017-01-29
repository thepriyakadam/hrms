class AddColToEmployeeAttendances < ActiveRecord::Migration
  def change
  	remove_column :employee_attendances, :in, :time
  	add_column :employee_attendances, :in_time, :time
  end
end
