class AddReffToGoalRatingSheet < ActiveRecord::Migration
  def change

    remove_column :goal_rating_sheets, :appraisee_rating, :integer
    remove_column :goal_rating_sheets, :appraiser_rating, :integer
    remove_column :goal_rating_sheets, :appraiser2_rating, :integer
    remove_column :goal_rating_sheets, :final_rating, :integer

    remove_column :attribute_rating_sheets, :appraisee_rating, :integer
    remove_column :attribute_rating_sheets, :appraiser_rating, :integer
    remove_column :attribute_rating_sheets, :appraiser2_rating, :integer
    remove_column :attribute_rating_sheets, :final_rating, :integer
    
    add_reference :goal_rating_sheets, :appraisee_rating, index: true, foreign_key: true
    add_reference :goal_rating_sheets, :appraiser_rating, index: true, foreign_key: true
    add_reference :goal_rating_sheets, :appraiser2_rating, index: true, foreign_key: true
    add_reference :goal_rating_sheets, :final_rating, index: true, foreign_key: true

    add_reference :attribute_rating_sheets, :appraisee_rating, index: true, foreign_key: true
    add_reference :attribute_rating_sheets, :appraiser_rating, index: true, foreign_key: true
    add_reference :attribute_rating_sheets, :appraiser2_rating, index: true, foreign_key: true
    add_reference :attribute_rating_sheets, :final_rating, index: true, foreign_key: true

  end
end
