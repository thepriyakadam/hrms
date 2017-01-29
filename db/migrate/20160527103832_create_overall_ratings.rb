class CreateOverallRatings < ActiveRecord::Migration
  def change
    create_table :overall_ratings do |t|
      t.references :goal_rating_sheet, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :ro1, index: true, foreign_key: true
      t.references :ro2, index: true, foreign_key: true
      t.references :final, index: true, foreign_key: true
      t.references :ro1_rating, index: true, foreign_key: true
      t.text :ro1_comment
      t.references :ro2_rating, index: true, foreign_key: true
      t.text :ro2_comment
      t.references :final_rating, index: true, foreign_key: true
      t.text :final_comment
      t.boolean :promotion
      t.decimal :increement_amount
      t.decimal :final_ctc
      t.text :appraisee_comment

      t.timestamps null: false
    end
  end
end
