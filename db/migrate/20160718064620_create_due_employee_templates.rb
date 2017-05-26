class CreateDueEmployeeTemplates < ActiveRecord::Migration
  def change
    create_table :due_employee_templates do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :due_template, index: true, foreign_key: true
      

      t.timestamps null: false
    end
  end
end
