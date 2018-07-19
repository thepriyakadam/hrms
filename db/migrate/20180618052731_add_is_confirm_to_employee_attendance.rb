class AddIsConfirmToEmployeeAttendance < ActiveRecord::Migration
  def change
  	add_column :employee_attendances, :is_regularization, :boolean
  end
end
