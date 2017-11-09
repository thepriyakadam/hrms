class AddReffToGoalRatings < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :attribute, index: true, foreign_key: true
  end
end
