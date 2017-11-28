module MembershipsHelper
	def all_membership
    Membership.where(status: true).collect { |x| [x.employee.try(:manual_employee_code).to_s + ' '+ x.employee.try(:first_name).to_s + ' ' + x.employee.try(:middle_name).to_s + ' ' + x.employee.try(:last_name).to_s, x.id] }
     end
end
