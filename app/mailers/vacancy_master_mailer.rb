class VacancyMasterMailer < ApplicationMailer

  def vacancy_request(vacancy_master)
    @employee = Employee.find_by(id: vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
    mail(to: @employee.email, subject: 'Vacancy Request')
  end

  def first_approve_email(vacancy_master)
    @reporting_master = Employee.find_by(id: vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    @employee = Employee.find(vacancy_master.employee_id)
    @manager_2 = Employee.find_by(id: @employee.manager_2_id)
    @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
    mail(to: @manager_2.email, subject: 'Request First Approved')
  end

  def approve_vacancy_email(vacancy_master)
    @vacancy_master = vacancy_master
    @reporting_master = Employee.find_by(id: vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    @employee = Employee.find(vacancy_master.employee_id)
    @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
    mail(to: @employee.email, subject: 'Request Approved')
  end
  
  def approve_and_send_next_email(vacancy_master)
    @reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @employee = Employee.find_by(id: vacancy_master.employee_id)
    @manager = Employee.find(@reporting_master.manager_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    mail(to: @manager.email, subject: 'Request Approved & Send Next')
  end

  def reject_vacancy_email(vacancy_master)
    @vacancy_master = vacancy_master
    @reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    @employee = Employee.find(@vacancy_master.employee_id)
    @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
    mail(to: @employee.email, subject: 'Request Rejected')
  end

  def final_approve(vacancy_master,recruiter)
    @vacancy_master = vacancy_master
    @employe = Employee.find_by(id: vacancy_master.employee_id)
    @recruiter = Employee.find_by(id: recruiter.employee_id)
    mail(to: @recruiter.email,cc: @employe.email, subject: 'Request Final Approved')
  end

  def confirm_resume(selected_resume)
    @selected_resume = selected_resume
    mail(to: @selected_resume.email_id, subject: 'Resume Confirmed')
  end

  def shortlist_resume(selected_resume)
    @selected_resume = selected_resume
    @vacancy_master = VacancyMaster.find_by(id: selected_resume.vacancy_master_id)
    @recruiter = Recruiter.find_by(employee_id: @vacancy_master.recruiter_id)
    @emp = Employee.find_by(id: @recruiter.employee_id)
    mail(to: @selected_resume.email_id,cc: @emp.email, subject: 'Resume shortlisted')
  end

  def update_no_of_position_email(vacancy_master)
    @vacancy_master = vacancy_master
    @reporting_master = Employee.find(vacancy_master.reporting_master_id)
    @particular_vacancy_requests = ParticularVacancyRequest.where(vacancy_master_id: @vacancy_master.id,status: "Approved").count
    @employee = Employee.find(@vacancy_master.employee_id)
    # @employee = VacancyMaster.find(vacancy_master.reporting_master_id)
    mail(to: @employee.email, subject: 'Request Reject')
  end

  def cancel_vacancy_email(vacancy_master)
    @reporting_master = ReportingMaster.find(vacancy_master.reporting_master_id)
    @employee = Employee.find(vacancy_master.employee_id)
    @vacancy_master = VacancyMaster.find(vacancy_master.id)
    @emp = VacancyMaster.find_by_employee_id(vacancy_master.employee_id)
    mail(to: @employee.email, subject: 'Request Cancel ')
  end
  
end