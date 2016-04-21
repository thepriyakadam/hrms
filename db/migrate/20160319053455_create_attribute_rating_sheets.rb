class CreateAttributeRatingSheets < ActiveRecord::Migration
  def change
    create_table :attribute_rating_sheets do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :appraiser_2, index: true, foreign_key: true
      t.references :final_id, index: true, foreign_key: true
      t.references :employee_attribute, index: true, foreign_key: true
      
      t.text :appraisee_comment
      t.integer :appraisee_rating
      t.boolean :is_confirm_appraisee

      t.text :appraiser_comment
      t.integer :appraiser_rating
      t.boolean :is_confirm_appraiser

      t.text :appraiser2_comment
      t.integer :appraiser2_rating
      t.boolean :is_confirm_appraiser2

      t.text :final_comment
      t.integer :final_rating
      t.boolean :is_confirm_final

      t.timestamps null: false
    end
  end
end


