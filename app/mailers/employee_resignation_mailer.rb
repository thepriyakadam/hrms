class EmployeeResignationMailer < ApplicationMailer

	def send_email_to_reporting_manager(employee_resignation)
		@employee_resignation = employee_resignation
		@employee = Employee.find(employee_resignation.reporting_master_id)
        mail(to: @employee.email, subject: 'Employee Resignation')
	end
	

end
