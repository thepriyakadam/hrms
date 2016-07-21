class CreateDueDetails < ActiveRecord::Migration
  def change
    create_table :due_details do |t|
      t.references :due_employee_template, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
