class OdRequestMailer < ApplicationMailer
	def pending(request)
    @od_request = request
    @manager = Employee.find(@od_request.employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'Od Request')
	end

  def first_approve_final(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Od Final Approved')
  end

	def first_approve(request)
    @od_request = request
    @from_manager = Employee.find(@od_request.first_reporter_id)
    to_manager = Employee.find(@od_request.second_reporter_id)
    email = to_manager.try(:email)
    mail(to: email, subject: 'Od First Approved')
  end

  def second_approve(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.second_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Od Approved Successfully')
  end

  def first_reject(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Od Request Rejected At First Level')
  end

  def second_reject(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    email = @employee.try(:email)
    mail(to: email, subject: 'Leave Rejected At Second Level')
  end

  def cancel(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    email = @manager.try(:email)
    mail(to: email, subject: 'Leave Cancelled By Employee')
  end
end
