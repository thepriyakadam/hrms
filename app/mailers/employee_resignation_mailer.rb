class EmployeeResignationMailer < ApplicationMailer


	def resignation_request(employee_resignation)
	    @employee = Employee.find(employee_resignation.reporting_master_id)
	    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	    @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	    mail(to: @employee.email, subject: 'Resignation Request')
    end
	
	def approve_resignation_email(employee_resignation)
	    @employee_resignation = employee_resignation
	    @reporting_master = Employee.find(employee_resignation.reporting_master_id)
	    @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	    @employee = Employee.find(@employee_resignation.employee_id)
	    @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	    mail(to: @employee.email, subject: 'Resignation Approve Request')
    end
    
     def reject_resignation_email(employee_resignation)
	     @employee_resignation = employee_resignation
	     @reporting_master = Employee.find(employee_resignation.reporting_master_id)
	     @employee_resignation = EmployeeResignation.find(employee_resignation.id)
	     @employee = Employee.find(@employee_resignation.employee_id)
	     @emp = EmployeeResignation.find_by_employee_id(employee_resignation.employee_id)
	     mail(to: @employee.email, subject: 'Resignation Request Rejected')
     end





end
