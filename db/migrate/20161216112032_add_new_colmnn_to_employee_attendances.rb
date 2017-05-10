class AddNewColmnnToEmployeeAttendances < ActiveRecord::Migration
  def change
  	add_column :employee_attendances, :month_name, :string
  end
end
