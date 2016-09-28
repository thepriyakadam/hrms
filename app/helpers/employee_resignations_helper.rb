module EmployeeResignationsHelper
  def all_resignation_list
	  EmployeeResignation.all.collect { |e| [e.employee.try(:first_name).to_s+' '+e.employee.try(:middle_name).to_s+' '+e.employee.try(:last_name).to_s, e.id] }
   end
 end