class AddNewRefToDueEmployeeDetails < ActiveRecord::Migration
  def change
    add_reference :due_employee_details, :employee_resignation, index: true, foreign_key: true
  end
end
