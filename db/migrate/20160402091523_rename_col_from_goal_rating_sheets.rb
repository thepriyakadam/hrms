class RenameColFromGoalRatingSheets < ActiveRecord::Migration
  def change
  	rename_column :goal_rating_sheets, :is_confirm, :is_confirm_appraiser
  end
end
