class AddGoalmeasureToEmployeeGoals < ActiveRecord::Migration
  def change
    add_column :employee_goals, :goal_measure, :string
  end
end
