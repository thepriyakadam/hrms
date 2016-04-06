class CreateGoalRatingSheets < ActiveRecord::Migration
  def change
    create_table :goal_rating_sheets do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :employee_goal, index: true, foreign_key: true
      t.boolean :allign_to_supervisor
      t.text :appraisee_comment
      t.integer :appraisee_rating
      t.text :appraiser_comment
      t.integer :appraiser_rating

      t.timestamps null: false
    end
  end
end
