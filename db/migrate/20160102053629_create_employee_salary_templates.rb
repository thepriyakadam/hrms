class CreateEmployeeSalaryTemplates < ActiveRecord::Migration
  def change
    create_table :employee_salary_templates do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :salary_template, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.boolean :is_deducted
      t.references :parent_salary_component, index: true, foreign_key: true
      t.decimal :percentage, precision: 15, scale: 2
      t.boolean :is_taxable
      t.decimal :tax, precision: 4, scale: 2
      t.string :base
      t.string :to_be_paid
      t.decimal :max_amount, precision: 15, scale: 2
      t.decimal :monthly_amount, precision: 15, scale: 2, default: 0
      t.decimal :annual_amount, precision: 15, scale: 2, default: 0
      t.references :employee_template, index: true, foreign_key: true
    
      t.timestamps null: false
    end
  end
end
