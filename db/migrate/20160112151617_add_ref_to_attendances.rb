class AddRefToAttendances < ActiveRecord::Migration
  def change
    add_reference :attendances, :shift_rotation, index: true, foreign_key: true
  end
end
