class ChangeColumnFromEmployeeResignation < ActiveRecord::Migration
  def change
  	remove_reference :employee_resignations, :change_status_employee, index: true, foreign_key: true
  	add_reference :employee_resignations, :change_status_employee
  end
end
