class SalaryslipComponent < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :salary_component
  # validates :salaryslip_id, uniqueness: { scope: [:salary_component_id] }
  
  def self.is_present(employee_template_id)
  	flag = false
    salaryslip_components = SalaryslipComponent.where(employee_template_id: employee_template_id)
    salaryslip_components.each do |l|
        if l.employee_template_id == employee_template_id
          flag = true
        end
      end
    flag
  end
  
end