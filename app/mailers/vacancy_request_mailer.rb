class VacancyRequestMailer < ApplicationMailer

	# def pending(vacancy_request)
	#  @vacancy_request = vacancy_request
	#  @manager = Employee.find(@vacancy_request.request_by.employee.try(:manager_id))
	#  email = @manager.email
	#  mail(to: email,subject: 'Vacancy Request')
 #  end

  def first_approve(vacancy_request)
  	@vacancy_request = vacancy_request
  	@from_manager = Employee.find(@vacancy_request.request_by_id)
    to_manager = Employee.find(@vacancy_request.request_by_id)
    email = to_manager.try(:email)
    mail(to: email, subject: 'Vacancy First Approved')
  end

  def second_approve(vacancy_request)
  	@vacancy_request = vacancy_request
    @employee = Employee.find(@vacancy_request.request_by_id)
    @manager = Employee.find(@vacancy_request.approval_by_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Vacancy Second Approved')
  end


  # def first_reject
  # 	@vacancy_request = vacancy_request
  #   @employee = Employee.find(@vacancy_request.request_by_id)
  #   email = @employee.try(:email)
  #   mail(to: email, subject: 'Vacancy Rejected At First Level')
  # end

  def final_approve(vacancy_request)
  	@vacancy_request = vacancy_request
  	@employee = Employee.find(@vacancy_request.request_by_id)
  	@manager = Employee.find(@vacancy_request.approval_by_id)
  	email = @employee.try(:email)
    mail(to: email, subject: 'Vacancy Final Approved')
  end
end