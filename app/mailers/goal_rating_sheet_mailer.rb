class GoalRatingSheetMailer < ApplicationMailer
  def send_email_to_appraiser1(goal_rating_sheet)
    @employee = Employee.find(goal_rating_sheet.appraiser_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
  end
  def send_email_to_appraiser2(goal_rating_sheet)
    @employee = Employee.find(goal_rating_sheet.appraiser_2_id)
    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
  end
end
