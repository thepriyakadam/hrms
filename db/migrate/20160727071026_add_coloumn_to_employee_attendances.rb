class AddColoumnToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :is_confirm, :boolean, default: :false
  end
end
