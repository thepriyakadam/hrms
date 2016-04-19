class AddrefrToGoalRatingSheets < ActiveRecord::Migration
  def change
  	 add_reference :goal_rating_sheets, :appraiser_2, index: true, foreign_key: true
  	 add_reference :goal_rating_sheets, :final_id, index: true, foreign_key: true

  	 add_reference :attribute_rating_sheets, :final_id, index: true, foreign_key: true
  	 add_reference :attribute_rating_sheets, :appraiser_2, index: true, foreign_key: true
  end
end
