class EmployeeLeavRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
  has_one :leav_cancelled
  has_one :leav_aproved
  has_one :leav_rejected
end
