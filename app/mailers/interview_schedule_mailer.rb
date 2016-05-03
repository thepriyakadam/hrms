class InterviewScheduleMailer < ApplicationMailer
  def sample_email(interview_schedule)
    @interview_schedule = InterviewSchedule.find_by_employee_id(interview_schedule.employee_id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: interview_schedule.email_id, subject: 'Interview Schedule')
  end
  
  def sample_email_to_candidate(interview_schedule)
    @interview_schedule = InterviewSchedule.find_by_employee_id(interview_schedule.employee_id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: interview_schedule.email_id, subject: 'Interview Rechedule')
  end

  def sample_email_to_interviewer(interview_schedule)
    @interview_schedule = InterviewSchedule.find_by_employee_id(interview_schedule.employee_id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: @employee.email, subject: 'Interview Confirmation')
  end

  def confirmation_email_to_candidate(interview_schedule)
    @interview_schedule = InterviewSchedule.find_by_employee_id(interview_schedule.employee_id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: @interview_schedule.email_id, subject: 'Interview Confirmation Details')
  end
end
