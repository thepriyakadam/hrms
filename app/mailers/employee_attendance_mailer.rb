class EmployeeAttendanceMailer < ApplicationMailer
	def pending(employee,date,employee_code,working_hrs,first_in_time,last_out_time)
    @employee = employee
    @working_hrs = working_hrs
    @first_in_time = first_in_time
    @last_out_time = last_out_time
    @date = date
    @employee_code = employee_code
    @manager = Employee.find(@employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'ACF Request')
  end

  def approved(pending_request,manager)
    @request = pending_request
    @manager = Employee.find_by(id: manager.id)
    employee = Employee.find(@request.employee_id)
    email = employee.email
    mail(to: email, subject: 'ACF Request Approved')
  end

  def rejected(pending_request,manager)
    @request = pending_request
    @manager = Employee.find_by(id: manager.id)
    employee = Employee.find(@request.employee_id)
    email = employee.email
    mail(to: email, subject: 'ACF Request Rejected')
  end
end
