class AddReffToGoalBunch < ActiveRecord::Migration
  def change
    add_reference :goal_bunches, :performance_calendar, index: true, foreign_key: true
  end
end
