class EmployeeResignationMailer < ApplicationMailer
  def resignation_request(employee_resignation)
      @reporting_master = ReportingMaster.find(employee_resignation.reporting_master_id)
	    @employee = Employee.find(@reporting_master.employee_id)
	    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	    @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	    mail(to: @employee.email, subject: 'Resignation Request')
  end
	
	def approve_resignation_email(employee_resignation)
	    @employee_resignation = employee_resignation
	    @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
	    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	    @employee = Employee.find(@employee_resignation.employee_id)
	    @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	    mail(to: @employee.email, subject: 'Resignation Request Approved ')
    end
    
    def reject_resignation_email(employee_resignation)
	     @employee_resignation = employee_resignation
	     @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
	     @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	     @employee = Employee.find(@employee_resignation.employee_id)
	     @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	     mail(to: @employee.email, subject: 'Resignation Request Rejected')
    end


    def edit_and_send_next(employee_resignation)
        @employee_resignation = employee_resignation
        @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
        @employee_resignation = EmployeeResignation.find(employee_resignation.id)
        @employee = Employee.find(@employee_resignation.employee_id)
        @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
        mail(to: @reporting_master.email, subject: 'Resignation Request Edited And Sent To Higher Authority Request')
    end



  # def edit_and_send_next(employee_transfer)
  #   @employee_transfer = employee_transfer
  #   @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
  #   @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
  #   @employee = Employee.find(@employee_transfer.employee_id)
  #   @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
  #   mail(to: @reporting_master.email, subject: 'Transfer Request Edited And Sent To Higher Authority Request')
  # end


    def approve_and_send_next(employee_resignation)
        @employee_resignation = employee_resignation
        @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
        @employee_resignation = EmployeeResignation.find(employee_resignation.id)
        @employee = Employee.find(@employee_resignation.employee_id)
        @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
        mail(to: @reporting_master.email, subject: 'Resignation Request Approved And Sent To Higher Authority Request')
    end


    def edit_and_approve(employee_resignation)
        # byebug
        @employee_resignation = employee_resignation
        @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
        @employee_resignation = EmployeeResignation.find(employee_resignation.id)
        @employee = Employee.find(@employee_resignation.employee_id)
        @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
        mail(to: @employee.email, subject: ' Resignation Updated And Approved ')
    end
end