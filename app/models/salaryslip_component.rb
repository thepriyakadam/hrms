class SalaryslipComponent < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :salary_component
  # validates :salaryslip_id, uniqueness: { scope: [:salary_component_id] }
end