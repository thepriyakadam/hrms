class ChangeColFromEmployeeResignation < ActiveRecord::Migration
  def change
  	remove_reference :employee_resignations, :reporting_master, index: true, foreign_key: true
  	add_reference :employee_resignations, :reporting_master
  end
end
