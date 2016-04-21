class CreateEmployeeGoals < ActiveRecord::Migration
  def change
    create_table :employee_goals do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :goal_perspective, index: true, foreign_key: true
      t.references :goal_measure, index: true, foreign_key: true

      t.references :employee, index: true, foreign_key: true
      t.references :period, index: true, foreign_key: true

      t.string :target
      t.integer :goal_weightage
      t.integer :difficulty_level
      t.string :allign_to_supervisor
      t.string :goal_measure
      t.boolean :is_confirm
      
      t.timestamps null: false
    end
  end
end
