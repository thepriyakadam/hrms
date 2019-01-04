class AddColmToGoalRatings < ActiveRecord::Migration
  def change
  	add_attachment :goal_ratings, :document
  end
end
