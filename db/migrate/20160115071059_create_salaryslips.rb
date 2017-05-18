class CreateSalaryslips < ActiveRecord::Migration
  def change
    create_table :salaryslips do |t|
      t.string :salary_slip_code
      t.references :employee, index: true, foreign_key: true
      t.date :month_year
      t.string :month
      t.string :year
      t.references :workingday, index: true, foreign_key: true
      t.decimal :actual_gross_salary, precision: 15, scale: 2
      t.decimal :calculated_gross_salary, precision: 15, scale: 2
      t.decimal :actual_total_deduction, precision: 15, scale: 2
      t.decimal :calculated_total_deduction, precision: 15, scale: 2
      t.decimal :actual_net_salary, precision: 15, scale: 2
      t.decimal :calculated_net_salary, precision: 15, scale: 2
      t.references :salary_template, index: true, foreign_key: true
      t.string :other_component_name
      t.references :employee_template, index: true, foreign_key: true
      t.decimal :arrear_actual_amount, precision: 15, scale: 2
      t.decimal :arrear_calculated_amount, precision: 15, scale: 2
      t.timestamps null: false
    end
  end
end
