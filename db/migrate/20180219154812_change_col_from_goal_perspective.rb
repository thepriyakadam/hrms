class ChangeColFromGoalPerspective < ActiveRecord::Migration
  def change
  	change_column :goal_perspectives, :name, :text
  end
end
