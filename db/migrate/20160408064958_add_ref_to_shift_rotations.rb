class AddRefToShiftRotations < ActiveRecord::Migration
  def change
    add_reference :shift_rotations, :department, index: true, foreign_key: true
  end
end
