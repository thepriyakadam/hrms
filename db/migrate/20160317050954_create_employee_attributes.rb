class CreateEmployeeAttributes < ActiveRecord::Migration
  def change
    create_table :employee_attributes do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :attribute_master, index: true, foreign_key: true
      t.references :definition, index: true, foreign_key: true
      t.integer :weightage
      t.text :appraisee_comment
      t.integer :appraisee_rating
      t.text :appraiser_comment
      t.integer :appraiser_rating

      t.timestamps null: false
    end
  end
end
