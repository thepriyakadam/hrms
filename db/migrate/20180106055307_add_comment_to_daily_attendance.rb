class AddCommentToDailyAttendance < ActiveRecord::Migration
  def change
    add_column :daily_attendances, :comment, :text
  end
end
