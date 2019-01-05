class AddColToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :emp_srno, :string
    #add_reference :employee_attendances, :shift_time, index: true, foreign_key: true
  end
end
