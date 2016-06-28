class InterviewRoundMailer < ApplicationMailer
   
  def send_email_to_interviewer(interview_round)
  	  @interview_round = interview_round
  	  @interview_round = InterviewRound.find(interview_round.id)
  	  @employee = Employee.find(@interview_round.employee_id)
  	  @interview_schedule = InterviewSchedule.find(interview_round.interview_schedule_id)
  	  # attachments.inline['logo1.jpg'] = File.read("#{Rails.root}/app/assets/images/logo.png")
      mail(to: @employee.email, subject: 'Interview Schedule')
  end

  def send_email_to_candidate(interview_round)
  	  @interview_round = interview_round
  	  @interview_round = InterviewRound.find(interview_round.id)
  	  @interview_schedule = InterviewSchedule.find(interview_round.interview_schedule_id)
  	  @employee = Employee.find(@interview_round.employee_id)
      mail(to: @interview_schedule.email_id, subject: 'Interview Schedule')
  end

  
end
