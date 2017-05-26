module EmployeeBankDetailsHelper
	def account_no(emp)
		EmployeeBankDetail.find_by_employee_id(emp).try(:account_no)
	end
end
