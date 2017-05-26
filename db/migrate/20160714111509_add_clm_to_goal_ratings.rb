class AddClmToGoalRatings < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :period, index: true, foreign_key: true
  end
end
