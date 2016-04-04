class AddColmToGoalRatingSheets < ActiveRecord::Migration
  def change
    add_column :goal_rating_sheets, :is_confirm_appraisee, :boolean
  end
end
