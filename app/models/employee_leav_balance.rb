class EmployeeLeavBalance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  belongs_to :company_leav
  validates :employee_id, uniqueness: { scope: [:leav_category_id]}
end
