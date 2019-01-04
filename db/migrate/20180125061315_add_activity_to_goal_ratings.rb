class AddActivityToGoalRatings < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :activity, :text
  end
end
