class EmployeeResignationMailer < ApplicationMailer
  def resignation_request(employee_resignation)
      # @reporting_master = ReportingMaster.find(employee_resignation.reporting_master_id)
	    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.reporting_master_id)
      @employe = Employee.find(@employee_resignation.employee_id)
	    @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	    mail(to: @employee.email,cc: "design@indibasolutions.com",bcc: @employe.company_location.email, subject: 'Resignation Request')

  end


  # def cancel_resignation_email(employee_resignation)
  #    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
  #     @employee = Employee.find(@employee_resignation.employee_id)
  #     @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
  #     mail(to: @employee.email, subject: 'Cancel Request')
  # end

  def cancel_resignation_email_to_reporting_manager(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @reporting_master.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Resignation Request Cancelled by Employee')
  end

  def first_level_approval_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @second_reporting_master = Employee.find(@employee_resignation.second_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Your resignation request has been approved')
  end
	
 def second_level_approval_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.second_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Resignation Request Approved at Second Level')
  end

  def second_level_request_email_to_reporting_manager(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
       @first_reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @reporting_master = Employee.find(@employee_resignation.second_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @reporting_master.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Resignation request pending for your approval')
  end

  def no_second_reporter_approval_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Your resignation request has been approved')
  end

  def no_second_reporter_reject_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Your resignation request has been rejected')
  end

  def first_reject_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.reporting_master_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Your resignation request has been rejected')
  end

  def second_reject_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.second_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Your resignation request has been rejected')
  end

  def final_approval_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.final_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Resignation Request Finally Approved')
  end

  def final_reject_email_to_employee(employee_resignation)
      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
      @employee = Employee.find(@employee_resignation.employee_id)
      @reporting_master = Employee.find(@employee_resignation.final_reporter_id)
      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
      mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: 'Resignation Request Finally Rejected')
  end
  

	# def approve_resignation_email(employee_resignation)
	#     @employee_resignation = employee_resignation
	#     @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
	#     @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	#     @employee = Employee.find(@employee_resignation.employee_id)
	#     @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	#     mail(to: @employee.email, subject: 'Resignation Request Approved ')
 #    end
    
 #    def reject_resignation_email(employee_resignation)
	#      @employee_resignation = employee_resignation
	#      @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
	#      @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	#      @employee = Employee.find(@employee_resignation.employee_id)
	#      @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	#      mail(to: @employee.email, subject: 'Resignation Request Rejected')
 #    end


 #    def edit_and_send_next(employee_resignation)
 #        @employee_resignation = employee_resignation
 #        @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
 #        @employee_resignation = EmployeeResignation.find(employee_resignation.id)
 #        @employee = Employee.find(@employee_resignation.employee_id)
 #        @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
 #        mail(to: @reporting_master.email, subject: 'Resignation Request Edited And Sent To Higher Authority Request')
 #    end



  # def edit_and_send_next(employee_transfer)
  #   @employee_transfer = employee_transfer
  #   @reporting_master = Employee.find(employee_transfer.reporting_master.employee_id)
  #   @employee_transfer = EmployeeTransfer.find(employee_transfer.id)
  #   @employee = Employee.find(@employee_transfer.employee_id)
  #   @emp = EmployeeTransfer.find_by_employee_id(employee_transfer.employee_id)
  #   mail(to: @reporting_master.email, subject: 'Transfer Request Edited And Sent To Higher Authority Request')
  # end


    # def approve_and_send_next(employee_resignation)
    #     @employee_resignation = employee_resignation
    #     @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
    #     @employee_resignation = EmployeeResignation.find(employee_resignation.id)
    #     @employee = Employee.find(@employee_resignation.employee_id)
    #     @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
    #     mail(to: @reporting_master.email, subject: 'Resignation Request Approved And Sent To Higher Authority Request')
    # end


    def edit_and_approve(employee_resignation)
        # byebug
        @employee_resignation = employee_resignation
        @reporting_master = Employee.find(employee_resignation.reporting_master.employee_id)
        @employee_resignation = EmployeeResignation.find(employee_resignation.id)
        @employee = Employee.find(@employee_resignation.employee_id)
        @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
        mail(to: @employee.email,cc: "exit@sganalytics.com",bcc: @employee.company_location.email, subject: ' Resignation Updated And Approved ')
    end
end