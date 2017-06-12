class AddColToGoalBunch < ActiveRecord::Migration
  def change
    add_reference :goal_bunches, :period, index: true, foreign_key: true
  end
end
