class AddColToGoalBunch < ActiveRecord::Migration
  def change
    add_column :goal_bunches, :transfer_option, :boolean
    add_column :goal_bunches, :transfer, :string
    add_column :goal_bunches, :comment, :text
  end
end
