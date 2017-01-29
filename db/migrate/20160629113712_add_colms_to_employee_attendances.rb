class AddColmsToEmployeeAttendances < ActiveRecord::Migration
  def change
  	remove_column :employee_attendances, :in_time, :time
  	remove_column :employee_attendances, :out, :time
  	add_column :employee_attendances, :in_time, :datetime
  	add_column :employee_attendances, :out_time, :datetime
  end
end
