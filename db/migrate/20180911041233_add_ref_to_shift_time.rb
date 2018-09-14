class AddRefToShiftTime < ActiveRecord::Migration
  def change
    add_reference :shift_times, :cost_center, index: true, foreign_key: true
  end
end
