class AddColToDailyAttendance < ActiveRecord::Migration
  def change
 
    add_column :daily_attendances, :latitude, :decimal
    add_column :daily_attendances, :longitude, :decimal
    add_column :daily_attendances, :place, :text
  end
end
