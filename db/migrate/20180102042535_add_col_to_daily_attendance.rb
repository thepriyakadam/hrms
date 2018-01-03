class AddColToDailyAttendance < ActiveRecord::Migration
  def change
remove_column :daily_attendances, :latitude, :string
remove_column :daily_attendances, :float, :string
remove_column :daily_attendances, :longitude, :string 
 
    add_column :daily_attendances, :latitude, :decimal
    add_column :daily_attendances, :longitude, :decimal
    add_column :daily_attendances, :place, :text
  end
end
