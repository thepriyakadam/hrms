class EmployeeResignationMailer < ApplicationMailer

	def send_email_to_repoting_manager(employee_resignation)
		@employee_resignation = employee_resignation
		@employee = Employee.find(employee_resignation.employee_id)
    mail(to: @employee.email, subject: 'Employee Resignation Confirmation')
	end
end
