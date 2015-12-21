class CreateEmployeeAnnualSalaries < ActiveRecord::Migration
  def change
    create_table :employee_annual_salaries do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
