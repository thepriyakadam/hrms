class AddColToGoalRatings < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :goal_type, :string
  end
end
