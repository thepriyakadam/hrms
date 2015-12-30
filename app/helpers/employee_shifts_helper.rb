module EmployeeShiftsHelper
	
	def all_company_shifts
		CompanyShift.all.collect {|x| [x.name,x.id]}
	end

end
