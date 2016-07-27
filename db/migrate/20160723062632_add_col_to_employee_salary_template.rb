class AddColToEmployeeSalaryTemplate < ActiveRecord::Migration
  def change
    add_column :employee_salary_templates, :is_confirm, :boolean
  end
end
