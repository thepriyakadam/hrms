class CreateDueEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :due_employee_details do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :due_template, index: true, foreign_key: true
      t.references :due_employee_template, index: true, foreign_key: true
      t.references :due_detail, index: true, foreign_key: true
      t.references :reporting_master, index: true, foreign_key: true
      t.boolean :is_confirmed

      t.timestamps null: false
    end
  end
end
