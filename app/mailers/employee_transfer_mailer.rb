class EmployeeTransferMailer < ApplicationMailer
	def transfer_request(employee_transfer)
		@reporting_master = ReportingMaster.find(employee_transfer.reporting_master)
    @employee = Employee.find(@reporting_master.employee_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Request')
	end

  def approve_transfer(employee_transfer)
      @employee_transfer = employee_transfer
      @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
      @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
      @employee = Employee.find(@employee_transfer.employee_id)
      @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
      mail(to: @employee.email, subject: 'Transfer Request Approved')
  end



  def reject_transfer(employee_transfer)
  	@employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Request Rejected ')
  end

  def edit_and_send_next(employee_transfer)
    @employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @reporting_master.email, subject: 'Transfer Request Edited And Sent To Higher Authority')
  end

  def approve_and_send_next(employee_transfer)
    @employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @reporting_master.email, subject: 'Transfer Request Approved And Sent To Higher Authority')
  end

  def edit_and_approve(employee_transfer)
    @employee_transfer = employee_transfer
    @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
    @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
    @employee = Employee.find(@employee_transfer.employee_id)
    @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
    mail(to: @employee.email, subject: 'Transfer Request Updated And Approved ')
  end

end
