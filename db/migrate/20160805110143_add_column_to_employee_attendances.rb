class AddColumnToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_column :employee_attendances, :count, :decimal, precision: 5, scale: 2
    add_reference :employee_attendances, :employee_leav_request, index: true, foreign_key: true
  end
end