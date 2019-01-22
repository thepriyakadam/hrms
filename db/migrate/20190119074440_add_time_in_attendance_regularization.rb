class AddTimeInAttendanceRegularization < ActiveRecord::Migration
  def change
    add_column :attendance_regularizations, :in_time, :time
    add_column :attendance_regularizations, :out_time, :time
    add_column :attendance_regularizations, :total_working_hrs, :string
  end
end
