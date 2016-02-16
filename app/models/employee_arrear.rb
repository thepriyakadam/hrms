class EmployeeArrear < ActiveRecord::Base
  belongs_to :employee
  has_many :employee_arrear_items
  validates :employee_id, uniqueness: {scope: [:is_paid]}
end
