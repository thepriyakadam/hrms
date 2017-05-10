module InductionDetailsHelper
  def have_completed_induction(employee)
    InductionDetail.find_by_employee_id_and_is_completed(employee.id, true).nil?
  end
end
