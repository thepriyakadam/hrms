class AddColToGoalPerspectives < ActiveRecord::Migration
  def change
    add_column :goal_perspectives, :status, :boolean
  end
end
