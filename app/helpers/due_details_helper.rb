module DueDetailsHelper
  def have_due_template(employee)
    DueEmployeeDetail.find_by_employee_id_and_is_confirmed(employee.id, true).nil?
  end
end
