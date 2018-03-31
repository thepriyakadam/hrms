class LoanRequestMailer < ApplicationMailer

	def pending(loanrequest)
		 # byebug
		@loanrequest = loanrequest
		@employee = Employee.find(@loanrequest.request_to_id)
		email = @employee.email
	    mail(to: email,subject: 'Loan Request')
	end

	def reject(loan_request)
		# byebug
		@loan_request = loan_request
		@employee = Employee.find(@loan_request.membership.employee_id)
		email = @employee.email
		mail(to: email,subject: 'Loan Request Requested')
		
	end
end
