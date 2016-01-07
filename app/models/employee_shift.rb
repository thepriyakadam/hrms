class EmployeeShift < ActiveRecord::Base
  #belongs_to :company_shift
  belongs_to :employee
  has_and_belongs_to_many :shift_rotations
  validates :company_shift_id, :presence => true
  validates :from_date, :presence => true
  validates :to_date, :presence => true
end
