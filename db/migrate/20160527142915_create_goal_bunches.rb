class CreateGoalBunches < ActiveRecord::Migration
  def change
    create_table :goal_bunches do |t|
      t.references :employee, index: true, foreign_key: true
      t.boolean :goal_confirm
      t.boolean :goal_approval

      t.references :appraisee
      t.string :appraisee_rating_id
      t.text :appraisee_comment
      t.boolean :appraisee_confirm


      t.references :appraiser
      t.string :appraiser_rating
      t.text :appraiser_comment
      t.boolean :appraiser_confirm

      t.references :reviewer
      t.text :review_comment
      t.references :reviewer_rating
      t.boolean :reviewer_confirm

      t.boolean :r_promotion
      t.boolean :r_increment
      t.references :r_designation
      t.decimal :r_ctc

      t.references :final
      t.text :final_comment
      t.references :final_rating
      t.boolean :final_confirm

      t.boolean :f_promotion
      t.boolean :f_increment
      t.references :f_designation
      t.decimal :f_ctc

      t.references :performance_calendar, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
