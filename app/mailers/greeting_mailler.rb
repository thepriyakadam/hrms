class GreetingMailler < ApplicationMailer
	def send_email_to_employee(employee,greeting)
		@employee = employee
		@greeting = greeting
		# @employee = Employee.find(@goal_rating.manager_id)
		# @emp = Employee.find(goal_rating)
    mail(to: @employee.email, subject: 'Congratulations!')
	end
end
