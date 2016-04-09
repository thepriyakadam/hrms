class ShiftRotation < ActiveRecord::Base
  belongs_to :company_shift
  belongs_to :department
  has_many :employee_shifts_shift_rotations
  has_many :employee_shifts, through: :employee_shifts_shift_rotations
end