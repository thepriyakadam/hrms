class EmployeeAttendanceMailer < ApplicationMailer
	def pending(employee)
    @employee = employee
    @manager = Employee.find(@employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'ACF Request')
  end
end
