class AddColToSalaryslipsAndSalaryslipComponents < ActiveRecord::Migration
  def change
    add_column :salaryslip_components, :calculated_amount, :decimal, precision: 15, scale: 2
    rename_column :salaryslip_components, :amount, :actual_amount

    rename_column :salaryslips, :gross_salary, :actual_gross_salary
    rename_column :salaryslips, :total_deduction, :actual_total_deduction
    rename_column :salaryslips, :net_salary, :actual_net_salary

    add_column :salaryslips, :calculated_gross_salary, :decimal, precision: 15, scale: 2
    add_column :salaryslips, :calculated_total_deduction, :decimal, precision: 15, scale: 2
    add_column :salaryslips, :calculated_net_salary, :decimal, precision: 15, scale: 2
  end
end
