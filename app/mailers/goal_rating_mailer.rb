class GoalRatingMailer < ApplicationMailer
	def send_email_to_appraiser(goal_rating)
		@goal_rating = goal_rating
		@employee = Employee.find(goal_rating.appraiser_id)
    mail(to: @employee.email, subject: 'Employee Goal Set')
	end
end
