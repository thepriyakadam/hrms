class COffMailer < ApplicationMailer
	def pending(request)
    @c_off_request = request
    @manager = Employee.find(@c_off_request.employee.try(:manager_id))
    email = @manager.email
    mail(to: email, subject: 'C.Off Request')
	end

	def first_approved(request)
		@c_off_request = request
		@manager1 = Employee.find(@c_off_request.employee.try(:manager_id))
    @manager = Employee.find(@c_off_request.employee.try(:manager_2_id))
    email = @manager.email
    mail(to: email, subject: 'C.Off First Approved')
	end

	def first_approved_without_manager(request)
		@c_off_request = request
		@manager = Employee.find(@c_off_request.employee.try(:manager_id))
    @employee = Employee.find(@c_off_request.employee_id)
    email = @employee.email
    mail(to: email, subject: 'C.Off Final Approved')
	end

	def first_reject(request)
		@c_off_request = request
		@manager1 = Employee.find(@c_off_request.employee.try(:manager_id))
    @employee = Employee.find(@c_off_request.employee_id)
    email = @employee.email
    mail(to: email, subject: 'C.Off First Rejected')
	end

	def final_reject(request,employee)
	@c_off_request = request
    @manager = Employee.find(employee.id)
    @employee = Employee.find(@c_off_request.employee_id)
    email = @employee.email
    mail(to: email, subject: 'C.Off Final Rejected')
	end

	def final_approved(request,employee)
    @c_off_request = request
    @manager = Employee.find(employee.id)
    @employee = Employee.find(@c_off_request.employee_id)
    email = @employee.email
    mail(to: email, subject: 'C.Off Final Approved')
	end

end
