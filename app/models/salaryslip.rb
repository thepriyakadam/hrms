class Salaryslip < ActiveRecord::Base
  protokoll :salary_slip_code, pattern: 'SAL#######'
  belongs_to :employee
  belongs_to :employee_bank_detail
  # belongs_to :template
  belongs_to :workingday
  belongs_to :salary_template
  has_many :salaryslip_components
  validates :employee_id, uniqueness: { scope: [:workingday_id] }
end
