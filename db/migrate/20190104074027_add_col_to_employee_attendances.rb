class AddColToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :emp_srno, :string
  end
end
