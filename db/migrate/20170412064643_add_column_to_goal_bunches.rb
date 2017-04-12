class AddColumnToGoalBunches < ActiveRecord::Migration
  def change
    add_column :goal_bunches, :goal_approval, :boolean
  end
end
