class LeaveStatusRecordMailer < ApplicationMailer
	def cancel_after_approve(particular_leave_record,current_emp)
		@current_emp = Employee.find(current_emp)
		@particular_leave_record = particular_leave_record
		@employee = Employee.find(@particular_leave_record.employee_id)
		@emp = @employee.email
		mail(to: @emp, subject: 'Leave Cancel')
	end
end
