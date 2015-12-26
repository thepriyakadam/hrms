class AddColumnToEmployeeAnnualSalary < ActiveRecord::Migration
  def change
    add_column :employee_annual_salaries, :percentage, :decimal, precision: 5, scale: 2 
    add_column :employee_annual_salaries, :parent_salary_component_id, :integer
    add_column :employee_annual_salaries, :is_deducted, :boolean
  end
end
