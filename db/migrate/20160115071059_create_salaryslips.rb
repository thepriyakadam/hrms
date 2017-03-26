class CreateSalaryslips < ActiveRecord::Migration
  def change
    create_table :salaryslips do |t|
      t.string :salary_slip_code
      t.references :employee, index: true, foreign_key: true
      t.references :workingday, index: true, foreign_key: true
      t.decimal :gross_salary, precision: 15, scale: 2
      t.decimal :total_deduction, precision: 15, scale: 2
      t.decimal :net_salary, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
