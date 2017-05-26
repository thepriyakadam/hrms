class EmployeeShift < ActiveRecord::Base
  belongs_to :employee
  has_many :employee_shifts_shift_rotations
  has_many :shift_rotations, through: :employee_shifts_shift_rotations
  # validates :company_shift_id, :presence => true
  # validates :from_date, :presence => true
  # validates :to_date, :presence => true
  # belongs_to :company_shift
end
