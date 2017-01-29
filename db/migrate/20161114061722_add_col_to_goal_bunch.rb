class AddColToGoalBunch < ActiveRecord::Migration
  def change
    add_reference :goal_bunches, :appraisee_rating, index: true, foreign_key: true
  end
end
