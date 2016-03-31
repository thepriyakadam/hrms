class CreateEmployeeGoals < ActiveRecord::Migration
  def change
    create_table :employee_goals do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :goal_perspective, index: true, foreign_key: true
      t.references :goal_measure, index: true, foreign_key: true
      t.string :target
      t.integer :goal_weightage
      t.integer :difficulty_level
      t.boolean :allign_to_supervisor
      t.text :appraisee_comment
      t.integer :appraisee_rating
      t.text :appraiser_comment
      t.integer :appraiser_rating

      t.timestamps null: false
    end
  end
end
