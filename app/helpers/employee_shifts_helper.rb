module EmployeeShiftsHelper
	
	def all_company_shifts
	    CompanyShift.all.collect {|x| [x.name.to_s+' - '+x.in_time.to_s+' TO '+x.out_time.to_s,x.id]}
	end

end
