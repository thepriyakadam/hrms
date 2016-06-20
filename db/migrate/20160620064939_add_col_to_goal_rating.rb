class AddColToGoalRating < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :type, :string
  end
end
