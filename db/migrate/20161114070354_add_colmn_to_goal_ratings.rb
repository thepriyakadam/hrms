class AddColmnToGoalRatings < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :appraisee_rating, index: true, foreign_key: true
  end
end
