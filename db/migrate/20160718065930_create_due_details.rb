class CreateDueDetails < ActiveRecord::Migration
  def change
    create_table :due_details do |t|
      t.references :due_employee_template, index: true, foreign_key: true
      t.references :reporting_master
      t.references :due_template, index: true, foreign_key: true
      t.boolean :is_confirmed
      t.boolean :status

      t.timestamps null: false
    end
  end
end
