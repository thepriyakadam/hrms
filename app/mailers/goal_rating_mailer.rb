class GoalRatingMailer < ApplicationMailer
	def send_email_to_appraiser
		@employee = Employee.find()
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
	end
end
