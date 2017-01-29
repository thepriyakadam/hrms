class EmployeeMailer < ApplicationMailer
  def birthday_email(employee)
    @employee = employee
    mail(to: employee.email, subject: 'Birthday Wishes')
  end

  def birthday_invitation(employee)
    @employee = Employee.find_by_id(employee.id)
    mail(to: @employee.email, subject: 'Birthday Invitation')
  end
end
