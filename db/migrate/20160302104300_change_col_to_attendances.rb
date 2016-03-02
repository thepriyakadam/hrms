class ChangeColToAttendances < ActiveRecord::Migration
  def change
    change_column :attendances, :attendance_date, :date
  end
end
