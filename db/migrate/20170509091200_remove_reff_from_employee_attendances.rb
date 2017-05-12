class RemoveReffFromEmployeeAttendances < ActiveRecord::Migration
  def change
  	remove_reference :employee_attendances, :employee_leav_request, index: true, foreign_key: true
  	add_reference :employee_attendances ,:employee_leav_request
  	remove_reference :employee_attendances, :on_duty_request, index: true, foreign_key: true
  	add_reference :employee_attendances ,:on_duty_request
  	remove_reference :employee_attendances, :employee, index: true, foreign_key: true
  	add_reference :employee_attendances ,:employee
  	remove_reference :employee_attendances, :department, index: true, foreign_key: true
  	add_reference :employee_attendances ,:department
  	remove_reference :employee_attendances, :machine_attendance, index: true, foreign_key: true
  	add_reference :employee_attendances ,:machine_attendance
  end
end
