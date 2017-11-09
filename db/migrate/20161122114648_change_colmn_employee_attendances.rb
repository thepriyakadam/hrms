class ChangeColmnEmployeeAttendances < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :in_time, :datetime
  	change_column :employee_attendances, :out_time, :datetime
  end
end
