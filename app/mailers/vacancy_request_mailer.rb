class VacancyRequestMailer < ApplicationMailer

	def pending(vacancy_request)
	 @vacancy_request = vacancy_request
   @employee = Employee.find_by(id: vacancy_request.request_by_id)
	 @manager = Employee.find_by(id: @employee.try(:manager_id))
	 email = @manager.email
	 mail(to: email,subject: 'Vacancy Request')
  end

  def cancel(vacancy_request)
    @vacancy_request = vacancy_request
    @employee = Employee.find_by(id: vacancy_request.request_by_id)
    @manager = Employee.find_by(id: @employee.try(:manager_id))
    email = @manager.email
    mail(to: email,subject: 'Vacancy Request')
  end

  def first_approve(vacancy_request)
  	@vacancy_request = vacancy_request
    @employee = Employee.find_by(id: vacancy_request.request_by_id)
    @from_manager = Employee.find_by(id: @employee.try(:manager_id))
    to_manager = Employee.find_by(id: @employee.try(:manager_2_id))
    email = to_manager.try(:email)
    mail(to: email, subject: 'Vacancy First Approved')
  end

  # def first_approve_final(vacancy_request)
  #   @vacancy_request = vacancy_request
  #   @employee = Employee.find_by(id: vacancy_request.request_by_id)
  #   email = @employee.try(:email)
  #   mail(to: email, subject: 'Vacancy Approved')
  # end

  def approve_and_send_next(vacancy_request)
    @vacancy_request = vacancy_request
    @employee = Employee.find_by(id: vacancy_request.approval_by_id)
    to_manager = Employee.find_by(id: @employee.try(:manager_id))
    email = to_manager.try(:email)
    mail(to: email, subject: 'Vacancy Approved And Send Next')
  end

  def approve(vacancy_request)
  	@vacancy_request = vacancy_request
    @employee = Employee.find_by(id: vacancy_request.request_by_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Vacancy Approved')
  end

  def reject(vacancy_request)
  	@vacancy_request = vacancy_request
    @employee = Employee.find(@vacancy_request.request_by_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Vacancy Request Rejected')
  end

  def final_approve(vacancy_request)
  	@vacancy_request = vacancy_request
  	@employee = Employee.find(@vacancy_request.request_by_id)
  	email = @employee.try(:email)
    mail(to: email, subject: 'Vacancy Final Approved')
  end

  def interview_schedule(candidate_interview_schedule)
    # byebug
    @candidate_interview_schedule = candidate_interview_schedule
    @employee = Employee.find(@candidate_interview_schedule.interviewer_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Interview Scheduled')
  end 

  def candidate_email(candidate_interview_schedule)
      # byebug
    @candidate_interview_schedule = candidate_interview_schedule
    @candidate = CandidateForm.find(@candidate_interview_schedule.candidate_form)
    email = @candidate.try(:email)
    mail(to: email, subject: 'Interview Scheduled')
  end
end