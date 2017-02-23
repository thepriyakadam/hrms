class AddNewColmToDueEmployeeDetails < ActiveRecord::Migration
  def change
  	remove_reference :due_employee_details, :due_employee_template, index: true, foreign_key: true
  	remove_reference :due_employee_details, :employee_resignation, index: true, foreign_key: true
  	add_column :due_employee_details, :is_sent, :true
  end
end
