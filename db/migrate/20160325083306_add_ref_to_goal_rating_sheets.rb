class AddRefToGoalRatingSheets < ActiveRecord::Migration
  def change
    add_reference :goal_rating_sheets, :performance_period, index: true, foreign_key: true
  end
end
