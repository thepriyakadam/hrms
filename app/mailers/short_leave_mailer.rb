class ShortLeaveMailer < ApplicationMailer
	def short_leave_request(short_leave_request)
    @short_leave_request = short_leave_request
    @employee = Employee.find_by(id: @short_leave_request.employee_id)
   	manager = @employee.manager_id
   	@manager = Employee.find_by(id: manager)
    mail(to: @manager.email, subject: 'Short Leave Request')
  end

  def short_leave_approval(short_leave_request)
    @short_leave_request = short_leave_request
    @employee = Employee.find_by(id: @short_leave_request.employee_id)
   	manager = @employee.manager_id
   	@manager = Employee.find_by(id: manager)
    mail(to: @employee.email, subject: 'Short Leave Approval')
  end

  def short_leave_reject(short_leave_request)
    @short_leave_request = short_leave_request
    @employee = Employee.find_by(id: @short_leave_request.employee_id)
   	manager = @employee.manager_id
   	@manager = Employee.find_by(id: manager)
    mail(to: @employee.email, subject: 'Short Leave Rejected')
  end
end
