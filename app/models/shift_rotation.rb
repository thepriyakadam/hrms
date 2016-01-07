class ShiftRotation < ActiveRecord::Base
  belongs_to :company_shift
  has_and_belongs_to_many :employee_shifts
end
