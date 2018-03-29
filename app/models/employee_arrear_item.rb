class EmployeeArrearItem < ActiveRecord::Base
  belongs_to :employee_arrear
  belongs_to :salary_component
  validates :employee_arrear_id, uniqueness: { scope: [:salary_component_id] }
end
