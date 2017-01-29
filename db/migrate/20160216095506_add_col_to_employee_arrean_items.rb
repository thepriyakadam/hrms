class AddColToEmployeeArreanItems < ActiveRecord::Migration
  def change
    add_column :employee_arrear_items, :is_deducted, :boolean
    add_column :salaryslips, :arrear_actual_amount, :decimal, precision: 15, scale: 2
    add_column :salaryslips, :arrear_calculated_amount, :decimal, precision: 15, scale: 2
    add_column :salaryslip_components, :is_arrear, :boolean
  end
end
