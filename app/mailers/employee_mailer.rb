class EmployeeMailer < ApplicationMailer

  def birthday_email(employee)
    @employee = employee
    mail(to: employee.email, subject: 'Birthday Wishes')
  end
  
end
