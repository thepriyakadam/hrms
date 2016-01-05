class AddAnnualAmountToEmployeeAnnualSalary < ActiveRecord::Migration
  def change
    add_column :employee_annual_salaries, :to_be_paid, :string
    add_column :employee_annual_salaries, :max_amount, :decimal, precision: 15, scale: 2
    add_column :employee_annual_salaries, :monthly_amount, :decimal, precision: 15, scale: 2
    add_column :employee_annual_salaries, :annual_amount, :decimal, precision: 15, scale: 2
    remove_column :employee_annual_salaries, :amount
  end
end
