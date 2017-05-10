class ChangeColmDueEmployeeDetails < ActiveRecord::Migration
  def change
  	add_column :due_employee_details, :is_proceed, :boolean,  default: false
  end
end
