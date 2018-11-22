class AddColumnToGoalBunch < ActiveRecord::Migration
  def change
    add_column :goal_bunches, :f_transfer_option, :boolean
    add_column :goal_bunches, :f_transfer, :string
    add_column :goal_bunches, :f_comment, :text
  end
end
