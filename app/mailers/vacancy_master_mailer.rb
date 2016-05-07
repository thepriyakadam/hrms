class VacancyMasterMailer < ApplicationMailer

  def vacancy_request(vacancy_master)
    # @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
    @employee = Employee.find(vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    mail(to: @employee.email, subject: 'Vacancy Request')
  end

  def approve_vacancy_email(vacancy_master)
    @vacancy_master = vacancy_master
  	@reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @employee = Employee.find(@vacancy_master.employee_id)
     # @employee = VacancyMaster.find(vacancy_master.reporting_master_id)
    mail(to: @employee.email, subject: 'Vacancy Approve Request')
  end
  
  def reject_vacancy_email(vacancy_master)
    @vacancy_master = vacancy_master
    @reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @employee = Employee.find(@vacancy_master.employee_id)
    # @employee = VacancyMaster.find(vacancy_master.reporting_master_id)
    mail(to: @employee.email, subject: 'Vacancy Reject Request')
  end

  def approve_and_send_next_email(vacancy_master)
     # @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
    @vacancy_master = vacancy_master
    @reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    mail(to: @reporting_master.email, subject: 'Vacancy Approved & Send Next')
  end

  def cancel_vacancy_email(vacancy_master)
    @employee = Employee.find(vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
    mail(to: @employee.email, subject: 'Vacancy Cancel Request')
  end
  
end