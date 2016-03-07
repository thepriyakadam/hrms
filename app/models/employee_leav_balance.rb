class EmployeeLeavBalance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  belongs_to :company_leav
  validates :employee_id, uniqueness: { scope: [:leav_category_id]}
  validates :no_of_leave, presence: true
  validates :expiry_date, presence: true
end
