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
      t.references :performance_calendar, index: true, foreign_key: true
      t.boolean :r_promotion
      t.boolean :r_increment
      t.references :r_designation
      t.decimal :r_ctc
      t.boolean :f_promotion
      t.boolean :f_increment
      t.references :f_designation
      t.decimal :f_ctc
      t.string :appraisee_rating_id
      t.boolean :goal_approval

      t.timestamps null: false
    end
  end
end
