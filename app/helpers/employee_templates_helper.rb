module EmployeeTemplatesHelper
  def have_template(employee)
    EmployeeTemplate.find_by_employee_id_and_is_active(employee.id, true).nil?
  end
end
