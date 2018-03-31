class OdRequestMailer < ApplicationMailer
	def pending(request)
    @od_request = request
    @manager = Employee.find(@od_request.employee.try(:manager_id))
    @emp = Employee.find_by(id: request.employee_id)
    if @emp == @manager
    mail(to: 'time@sganalytics.com',cc: @emp.company_location.email, subject: 'On duty request pending for approval')
    else
    email = @manager.email

    mail(to: email ,cc: @emp.company_location.email, subject: 'On Duty request pending for approval')
    end
  end

  def first_approve_final(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    
    @manager = Employee.find(@od_request.first_reporter_id)
    @emp = Employee.find_by(id: request.employee_id)
    email = @employee.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'Your on duty request has been approved')
  end

	def first_approve(request)
    @od_request = request
    @from_manager = Employee.find(@od_request.first_reporter_id)
    to_manager = Employee.find(@od_request.second_reporter_id)
    @emp = Employee.find_by(id: request.employee_id)
    email = to_manager.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'OD First Approved')
  end

  def second_approve(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    @emp = Employee.find_by(id: request.employee_id)
    email = @employee.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'Your on duty request has been approved')
  end

  def first_reject(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @emp = Employee.find_by(id: request.employee_id)
    email = @employee.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'OD Request Rejected At First Level')
  end

  def second_reject(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    @emp = Employee.find_by(id: request.employee_id)
    email = @employee.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'OD Rejected At Second Level')
  end

  def cancel(request)
    @od_request = request
    @employee = Employee.find(@od_request.employee_id)
    @manager = Employee.find(@od_request.first_reporter_id)
    @emp = Employee.find_by(id: request.employee_id)
    if @emp == @manager
    mail(to: 'time@sganalytics.com',cc: @emp.company_location.email, subject: 'On Duty request cancellation by your direct reportee')
    else
    email = @manager.try(:email)
    mail(to: email ,cc: @emp.company_location.email, subject: 'On Duty request cancellation by your direct reportee')
  end
  end

  def cancel_after_approve(particular_od_record,current_emp)
    @current_emp = Employee.find(current_emp)
    @particular_od_record = particular_od_record
    @employee = Employee.find(@particular_od_record.employee_id)
    @emp = @employee.email
    mail(to: @emp, subject: 'OD Cancel')
  end

end
