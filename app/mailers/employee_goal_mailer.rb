class EmployeeGoalMailer < ApplicationMailer
   

    def send_email_to_employee(employee_goal)
	    @employee = Employee.find(employee_goal.employee_id)
	    @employee_goal = EmployeeGoal.find(employee_goal.id)
	    mail(to: @employee.email, subject: 'Employee Goal Confirmation')
    end

    def send_email_to_appraiser1(employee_goal)
      @employee = Employee.find(employee_goal.employee_id)
      mail(to: @employee.email, subject: 'Employee Goal Confirmation')
    end

  # def vacancy_request(vacancy_master)
  #    # @vacancy_master = VacancyMaster.find_by_reporting_master_id(vacancy_master.reporting_master_id)
  #    @employee = Employee.find(vacancy_master.reporting_master_id)
  #    @vacancy_master = VacancyMaster.find(vacancy_master.id)
  #    mail(to: @employee.email, subject: 'Vacancy Request')
  # end

end
