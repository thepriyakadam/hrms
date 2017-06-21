class GreetingMailler < ApplicationMailer
	def send_email_to_employee(greeting)
		@greeting = greeting
		@employee = Employee.find(@greeting.receiver_id)
	  mail(to: @employee.email, subject: 'Congratulations!')
	end
end
