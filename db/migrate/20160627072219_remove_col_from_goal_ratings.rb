class RemoveColFromGoalRatings < ActiveRecord::Migration
  def change
  	remove_column :goal_ratings, :type, :string
  end
end
