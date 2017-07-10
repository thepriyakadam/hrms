class EmployeeAttendanceMailer < ApplicationMailer
	def pending(employee_attendance)
    @employee_attendance = employee_attendance
    @manager = Employee.find(@employee_attendance.employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'ACF Request')
  end
end
