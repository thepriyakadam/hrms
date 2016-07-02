class AddColmToGoalRatings < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :is_hide, :boolean
  end
end
