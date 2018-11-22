class AddLatitudeLongitudePlaceCommentToDailyAttendances < ActiveRecord::Migration
  def change
    add_column :daily_attendances, :latitude, :float
    add_column :daily_attendances, :longitude, :float
    add_column :daily_attendances, :place, :string
    # add_column :daily_attendances, :comment, :string
  end
end
