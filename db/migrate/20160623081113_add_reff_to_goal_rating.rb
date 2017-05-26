class AddReffToGoalRating < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :performance_calendar, index: true, foreign_key: true
  end
end
