module EmployeeNominationsHelper
  def all_family_type(employee)
    employee.families.collect { |x| [x.f_name, x.id] }
  end

  def all_family_typ
  	employee_nomination = EmployeeNomination.new(family_id)
    employee = Employee.find(params[:employee_nomination][:employee_id])
    Family.employee.all.collect { |x| [x.f_name, x.id] }.where(employee_id: employee.id)
  end
end
