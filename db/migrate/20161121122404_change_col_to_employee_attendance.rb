class ChangeColToEmployeeAttendance < ActiveRecord::Migration
  def change
  	change_column :employee_attendances, :in_time, :date
  	change_column :employee_attendances, :out_time, :date
  	add_reference :employee_attendances, :machine_attendances, index: true, foreign_key: true
  	add_column :employee_attendances, :company_hrs, :string
  	add_column :employee_attendances, :overtime_hrs, :string
  end
end
