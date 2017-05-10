class EmployeeShiftsShiftRotation < ActiveRecord::Base
  belongs_to :shift_rotation
  belongs_to :employee_shift
end
