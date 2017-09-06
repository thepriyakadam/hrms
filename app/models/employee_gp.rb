class EmployeeGp < ActiveRecord::Base

  validates :employee_id, uniqueness: { scope: [:from_date, :to_date] }
  belongs_to :employee
end
