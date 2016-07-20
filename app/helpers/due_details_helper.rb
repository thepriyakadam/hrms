module DueDetailsHelper

   def all_resignation_list
	  EmployeeResignation.all.collect { |e| [e.employee.try(:first_name).to_s+' '+e.employee.try(:middle_name).to_s+' '+e.employee.try(:last_name).to_s, e.id] }
   end
   
   def all_due_template_list
    DueTemplate.all.collect {|x| [x.code.to_s + ' - ' + x.name.to_s,x.id]}   
   end

end
