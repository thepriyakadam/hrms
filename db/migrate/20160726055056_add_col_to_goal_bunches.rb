class AddColToGoalBunches < ActiveRecord::Migration
  def change
    add_column :goal_bunches, :r_promotion, :boolean
    add_column :goal_bunches, :r_increment, :boolean
    add_reference :goal_bunches, :r_designation, index: true, foreign_key: true
    add_column :goal_bunches, :r_ctc, :decimal
    add_column :goal_bunches, :f_promotion, :boolean
    add_column :goal_bunches, :f_increment, :boolean
    add_reference :goal_bunches, :f_designation, index: true, foreign_key: true
    add_column :goal_bunches, :f_ctc, :decimal
  end
end
