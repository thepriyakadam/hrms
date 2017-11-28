module EmployeeTypesHelper
  def all_employee_type
    EmployeeType.all.collect { |x| [x.name, x.id] }
  end
end
