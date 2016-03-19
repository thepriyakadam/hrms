class CreateAttributeRatingSheets < ActiveRecord::Migration
  def change
    create_table :attribute_rating_sheets do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :employee_attribute, index: true, foreign_key: true
      t.text :appraisee_comment
      t.integer :appraisee_rating
      t.text :appraiser_comment
      t.integer :appraiser_rating

      t.timestamps null: false
    end
  end
end
