class VacancyRequestMailer < ApplicationMailer

	def pending(vacancy_request)
	# byebug
  #    @vacancy_request = VacancyRequest.find(vacancy_request.id)
  #    @employee = Employee.find(@vacancy_request.approval_by_id)
	 # @emp = VacancyRequest.find_by_approval_by_id(vacancy_request.approval_by_id)
	 # mail(to: @employee.email, subject: 'Vacancy Request')
	 @vacancy_request = vacancy_request
	 @manager = Employee.find(@vacancy_request.request_by.employee.try(:manager_id))
	 email = @manager.email
	 mail(to: email,subject: 'Vacancy Request')
  end
end
