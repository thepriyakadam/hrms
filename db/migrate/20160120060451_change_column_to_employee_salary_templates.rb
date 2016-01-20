class ChangeColumnToEmployeeSalaryTemplates < ActiveRecord::Migration
  def change
    change_column :employee_salary_templates, :monthly_amount, :decimal, precision: 15, scale: 2, default: 0
    change_column :employee_salary_templates, :annual_amount, :decimal, precision: 15, scale: 2, default: 0
  end
end
