class AddRefToGoalRatings < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :attribute_master, index: true, foreign_key: true
  end
end
