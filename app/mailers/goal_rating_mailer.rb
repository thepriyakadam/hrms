class GoalRatingMailer < ApplicationMailer
	def send_email_to_appraiser
		@employee = Employee.find(goal_rating.appraiser_2_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
	end
end
