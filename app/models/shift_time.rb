class ShiftTime < ActiveRecord::Base
  has_many :shift_employees
  has_many :shift_schedules
  belongs_to :cost_center
  has_many :employee_attendances
  has_many :latemark_masters
end
