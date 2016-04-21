class AddclumToGoalRtaingSheets < ActiveRecord::Migration
  def change
  	add_column :goal_rating_sheets, :is_confirm_final, :boolean
    add_column :goal_rating_sheets, :is_confirm_appraiser2, :boolean

    add_column :attribute_rating_sheets, :is_confirm_final, :boolean
    add_column :attribute_rating_sheets, :is_confirm_appraiser2, :boolean
  end
end
