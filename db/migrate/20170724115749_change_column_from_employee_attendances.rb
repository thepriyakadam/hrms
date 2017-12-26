class ChangeColumnFromEmployeeAttendances < ActiveRecord::Migration
  def change
  	 change_column :employee_attendances, :employee_code, :integer
  end
end
