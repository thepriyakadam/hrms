class AddColToPayrollOvertimeMaster < ActiveRecord::Migration
  def change
    add_column :payroll_overtime_masters, :company_hrs, :string
  end
end
