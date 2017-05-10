class AddCollToGoalRatings < ActiveRecord::Migration
  def change
    add_column :goal_ratings, :is_assigned, :boolean
  end
end
