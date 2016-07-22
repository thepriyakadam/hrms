class AddNewColumnToDueEmployeeDetals < ActiveRecord::Migration
  def change
    add_column :due_employee_details, :is_confirmed, :boolean
    add_reference :due_actions, :due_employee_detail, index: true, foreign_key: true
  end
end
