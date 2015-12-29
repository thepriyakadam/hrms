class AddIsTaxableToEmployeeAnnualSalary < ActiveRecord::Migration
  def change
    add_column :employee_annual_salaries, :is_taxable, :boolean
    add_column :employee_annual_salaries, :tax, :decimal, precision: 15, scale: 2
    add_column :employee_annual_salaries, :base, :string
  end
end
