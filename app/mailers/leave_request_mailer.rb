class LeaveRequestMailer < ApplicationMailer
  def pending(request)
    @leave_request = request
    @manager = Employee.find(@leave_request.employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'Leave Request')
  end

  def first_approve(request)
    @leave_request = request
    
    @from_manager = Employee.find(@leave_request.first_reporter_id)
    to_manager = Employee.find(@leave_request.second_reporter_id)
    email = to_manager.try(:email)
    mail(to: email, subject: 'Leave First Approved')
  end

  def first_approve1(request)
    @leave_request = request
    @employee = Employee.find(@leave_request.employee_id)
    @manager = Employee.find(@leave_request.first_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Leave First Approved')
  end

  def second_approve(request)
    @leave_request = request
    @employee = Employee.find(@leave_request.employee_id)
    @manager = Employee.find(@leave_request.second_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Leave Approved Successfully')
  end

  def first_reject(request)
    @leave_request = request
    @employee = Employee.find(@leave_request.employee_id)
    #@manager = Employee.find(@leave_request.second_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Leave Rejected At First Level')
  end

  def second_reject(request)
    @leave_request = request
    @employee = Employee.find(@leave_request.employee_id)
    @manager = Employee.find(@leave_request.first_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Leave Rejected At Second Level')
  end

  def cancel(request)
    @leave_request = request
    @employee = Employee.find(@leave_request.employee_id)
    @manager = Employee.find(@leave_request.first_reporter_id)
    email = @manager.try(:email)
    mail(to: email, subject: 'Leave Cancelled By Employee')
  end
end
