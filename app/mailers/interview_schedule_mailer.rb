class InterviewScheduleMailer < ApplicationMailer
  
  def sample_email(interview_schedule)
    @employee = Employee.find(interview_schedule.employee_id)
    @interview_schedule = InterviewSchedule.find(interview_schedule.id)
    @emp = InterviewSchedule.find_by_employee_id(interview_schedule.employee_id)
    mail(to: @interview_schedule.email_id, subject: 'Interview Schedule')
  end

  def sample_email_to_candidate(interview_schedule)
    @interview_schedule = interview_schedule
    @interview_schedule = InterviewSchedule.find(interview_schedule.id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: interview_schedule.email_id, subject: 'Interview Rechedule')
  end

  # def approve_vacancy_email(vacancy_master)
  #   @vacancy_master = vacancy_master
  #   @reporting_master = Employee.find(vacancy_master.reporting_master_id)
  #   @vacancy_master = VacancyMaster.find(vacancy_master.id)
  #   @employee = Employee.find(@vacancy_master.employee_id)
  #   @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
  #   # @employee = VacancyMaster.find(vacancy_master.reporting_master_id)
  #   mail(to: @employee.email, subject: 'Vacancy Approve Request')
  # end

  def sample_email_to_interviewer(interview_schedule)
    @interview_schedule = interview_schedule
    @interview_schedule = InterviewSchedule.find(interview_schedule.id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: @employee.email, subject: 'Interview Confirmation Details')
  end

  def confirmation_email_to_candidate(interview_schedule)
    @interview_schedule = interview_schedule
    @interview_schedule = InterviewSchedule.find(interview_schedule.id)
    @employee = Employee.find(@interview_schedule.employee_id)
    mail(to: @interview_schedule.email_id, subject: 'Interview Confirmation Details')
  end
end
