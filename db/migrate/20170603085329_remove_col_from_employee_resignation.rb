class RemoveColFromEmployeeResignation < ActiveRecord::Migration
  def change
    remove_reference :employee_resignations, :change_status_employee
     add_reference :employee_resignations, :change_status_employee
  end
end
