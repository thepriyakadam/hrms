class AddRefToGoalRating < ActiveRecord::Migration
  def change
    add_reference :goal_ratings, :training_topic_master, index: true, foreign_key: true
  end
end
