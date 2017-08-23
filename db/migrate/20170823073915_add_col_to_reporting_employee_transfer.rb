class AddColToReportingEmployeeTransfer < ActiveRecord::Migration
  def change
    remove_reference :reporting_employee_transfers, :reporting_master, index: true, foreign_key: true
    add_reference :reporting_employee_transfers, :reporting_master
  end
end
