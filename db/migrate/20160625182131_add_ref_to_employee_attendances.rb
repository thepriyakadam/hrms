class AddRefToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :department, index: true, foreign_key: true
  end
end
