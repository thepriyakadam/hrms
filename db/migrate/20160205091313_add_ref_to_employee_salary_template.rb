class AddRefToEmployeeSalaryTemplate < ActiveRecord::Migration
  def change
    add_reference :employee_salary_templates, :employee_template, index: true, foreign_key: true
    add_reference :salaryslips, :employee_template, index: true, foreign_key: true
    add_reference :salaryslip_components, :employee_template, index: true, foreign_key: true
  end
end
