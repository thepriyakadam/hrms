class AddColmnToGoalPerspectives < ActiveRecord::Migration
  def change
    add_reference :goal_perspectives, :department, index: true, foreign_key: true
  end
end
