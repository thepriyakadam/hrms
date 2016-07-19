class GoalBunchMailer < ApplicationMailer
	def send_email_to_appraisee(goal_bunch)
		@goal_bunch = goal_bunch
		@employee = Employee.find(goal_bunch.employee_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
	end
	def send_email_to_appraiser(goal_bunch)
		@goal_bunch = goal_bunch
		@employee = Employee.find(goal_bunch.employee.manager_id)
		@emp = Employee.find(goal_bunch.employee_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
	end
	def send_email_to_reviewer(goal_bunch)
		@goal_bunch = goal_bunch
		@employee = Employee.find(goal_bunch.employee.manager_2_id)
		@emp = Employee.find(goal_bunch.employee_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
	end
end
