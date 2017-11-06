class CreateChangeDesignations < ActiveRecord::Migration
  def change
    create_table :change_designations do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :employee_designation, index: true, foreign_key: true
      t.date :effective_from
      t.date :effective_to
      t.boolean :status
      t.references :change_by
      t.timestamps null: false
    end
  end
end
