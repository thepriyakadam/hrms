class AddColToHolidayForEmployeeAttendance < ActiveRecord::Migration
  def change
  	add_column :holidays, :is_send, :boolean, default: false
  end
end
