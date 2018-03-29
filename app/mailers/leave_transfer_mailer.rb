class LeaveTransferMailer < ApplicationMailer
	def pending(request)
    @leave_transfer = request
    @employee = Employee.find_by(id: @leave_transfer.employee_id)
    @transfer_to = Employee.find_by(id: @leave_transfer.transfer_to_id)
    
    mail(to: @employee.company_location.email, subject: 'Leave Transfer Request')
  end

  def approved(request,employee)
    @leave_transfer = request
    @current_user = employee
    @employee = Employee.find_by(id: @leave_transfer.employee_id)
    @transfer_to = Employee.find_by(id: @leave_transfer.transfer_to_id)
    
    mail(to: @employee.email,to: @transfer_to.email, subject: 'Leave Transfer Request Approved')
  end

  def rejected(request,employee)
    @leave_transfer = request
    @current_user = employee
    @employee = Employee.find_by(id: @leave_transfer.employee_id)
    @transfer_to = Employee.find_by(id: @leave_transfer.transfer_to_id)
    
    mail(to: @employee.email,to: @transfer_to.email, subject: 'Leave Transfer Request Rejected')
  end
end
