class AddColToGoalBunchs < ActiveRecord::Migration
  def change
    add_column :goal_bunches, :goal_confirm, :boolean
  end
end
