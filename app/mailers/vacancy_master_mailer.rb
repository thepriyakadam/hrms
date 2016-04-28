class VacancyMasterMailer < ApplicationMailer
  
  def vacancy_request(vacancy_master)
     # @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
     @employee = Employee.find(vacancy_master.reporting_master_id)
     @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
     mail(to: @employee.email, subject: 'Vacancy Request')
  end

  def approve_vacancy_email(vacancy_master)
  	 @employee = Employee.find(vacancy_master.reporting_master_id)
     # @employee = VacancyMaster.find(vacancy_master.reporting_master_id)
     @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
     mail(to: @employee.email, subject: 'Vacancy Approve Request')
  end

  def reject_vacancy_email(vacancy_master)
  	 @employee = Employee.find(vacancy_master.reporting_master_id)
     @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
     mail(to: @employee.email, subject: 'Vacancy Reject Request')
  end

   def cancel_vacancy_email(vacancy_master)
     @employee = Employee.find(vacancy_master.reporting_master_id)
     @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
     mail(to: @employee.email, subject: 'Vacancy Cancel Request')
  end

end