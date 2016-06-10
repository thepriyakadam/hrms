class GoalRatingMailer< ApplicationMailer
	def send_email_to_appraiser(goal_rating)
		
    mail(to: goal_rating.email, subject: 'Employee Goal Set')
	end
end