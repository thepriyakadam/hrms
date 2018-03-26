class CompanyShift < ActiveRecord::Base
  has_many :employee_shifts
  has_many :shift_rotations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
