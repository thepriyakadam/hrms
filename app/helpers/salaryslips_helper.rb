module SalaryslipsHelper
  def create_salaryslip_component(left_esic, final_esic, id)
    @salaryslip_component = SalaryslipComponent.new do |sc|
      sc.actual_amount = left_esic.ceil
      sc.calculated_amount = '%.0f' % final_esic
      sc.is_deducted = true
      sc.salary_component_id = id
    end
    @salaryslip_component
  end
end
