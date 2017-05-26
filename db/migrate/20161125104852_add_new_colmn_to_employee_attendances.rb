class AddNewColmnToEmployeeAttendances < ActiveRecord::Migration
  def change
  	add_column :employee_attendances, :total_hrs, :string
  end
end
