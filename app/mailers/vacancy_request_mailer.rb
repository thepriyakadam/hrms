class VacancyRequestMailer < ApplicationMailer

	def pending(request)
    @vacancy_request = request
    @manager = Employee.find(@vacancy_request.employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'Vacancy Request')
  end
end
