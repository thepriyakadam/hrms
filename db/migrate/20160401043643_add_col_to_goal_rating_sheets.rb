class AddColToGoalRatingSheets < ActiveRecord::Migration
  def change
    add_column :goal_rating_sheets, :is_confirm, :boolean
  end
end
