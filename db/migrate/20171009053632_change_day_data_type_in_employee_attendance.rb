class ChangeDayDataTypeInEmployeeAttendance < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :day, :datetime
  end
end
