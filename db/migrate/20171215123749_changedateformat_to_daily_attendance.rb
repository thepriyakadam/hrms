class ChangedateformatToDailyAttendance < ActiveRecord::Migration
  def change
	change_column :daily_attendances, :time, :datetime
  end
end
