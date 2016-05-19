module EmployeeNominationsHelper
	def all_nomination_type
    NominationMaster.all.collect { |x| [x.name, x.id] }
  end

  def all_family_type(employee)
    employee.families.collect { |x| [x.f_name, x.id] }
  end

  def all_relation_type
  	RelationMaster.all.collect {|r| [r.name, r.id]}
  end

  def all_family_typ
  	employee_nomination = EmployeeNomination.new(family_id)
    employee = Employee.find(params[:employee_nomination][:employee_id])
    Family.employee.all.collect { |x| [x.f_name, x.id] }.where(employee_id: employee.id)
  end
end
