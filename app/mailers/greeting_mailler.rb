class GreetingMailler < ApplicationMailer
	def send_email_to_employee(greeting)
		@greeting = greeting
		@employee = Employee.find(@greeting.receiver_id)
	  mail(to: @employee.email, subject: 'Happy Birthday!')
	end

	def send_anniversary_mail_to_employee(greeting)
		@greeting = greeting
		@employee = Employee.find(@greeting.receiver_id)
		mail(to: @employee.email,subject: 'Happy Anniversary!')
	end
end
