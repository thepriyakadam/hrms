class ChangeGoalWeightageToFloatInGoalRatings < ActiveRecord::Migration
  def change
  	change_column :goal_ratings, :goal_weightage, :float
  end
end
