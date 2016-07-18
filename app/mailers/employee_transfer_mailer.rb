class EmployeeTransferMailer < ApplicationMailer
	def transfer_request(employee_transfer)
		@employee = Employee.find(employee_transfer.reporting_master_id)
    #@employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    #@emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Request')
	end

	def approve_transfer(employee_transfer)
    @employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Approve Request')
  end

  def reject_transfer(employee_transfer)
  	@employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Reject Request')
  end

  def approve_and_send_next(employee_transfer)
    @employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    mail(to: @reporting_master.email, subject: 'Vacancy Approved & Send Next')
  end

end
