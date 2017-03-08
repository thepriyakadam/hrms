class AddColToGoalPerspective < ActiveRecord::Migration
  def change
    add_column :goal_perspectives, :goal_weightage, :boolean
    add_column :goal_perspectives, :from, :integer
    add_column :goal_perspectives, :to, :integer
  end
end
