class CreateEmployeeAttributes < ActiveRecord::Migration
  def change
    create_table :employee_attributes do |t|
      t.references :appraisee, index: true, foreign_key: true
      t.references :appraiser, index: true, foreign_key: true
      t.references :attribute_master, index: true, foreign_key: true
      t.references :definition, index: true, foreign_key: true
      t.integer :weightage

      t.references :employee, index: true, foreign_key: true
      t.references :performance_period, index: true, foreign_key: true

      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
