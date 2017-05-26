class CreateEmployeeTemplates < ActiveRecord::Migration
  def change
    create_table :employee_templates do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :salary_template, index: true, foreign_key: true
      t.decimal :gross_salary
      t.boolean :is_active, default: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
