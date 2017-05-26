class CreateGoalBunches < ActiveRecord::Migration
  def change
    create_table :goal_bunches do |t|
      t.references :employee, index: true, foreign_key: true
      t.boolean :goal_confirm
      t.references :appraisee, index: true, foreign_key: true
      t.text :appraisee_comment
      t.boolean :appraisee_confirm
      t.references :appraiser, index: true, foreign_key: true
      t.string :appraiser_rating
      t.text :appraiser_comment
      t.boolean :appraiser_confirm
      t.references :reviewer, index: true, foreign_key: true
      t.text :review_comment
      t.references :reviewer_rating, index: true, foreign_key: true
      t.boolean :reviewer_confirm
      t.references :final, index: true, foreign_key: true
      t.text :final_comment
      t.references :final_rating, index: true, foreign_key: true
      t.boolean :final_confirm

      t.timestamps null: false
    end
  end
end
