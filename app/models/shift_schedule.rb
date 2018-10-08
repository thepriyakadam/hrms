class ShiftSchedule < ActiveRecord::Base
  belongs_to :shift_time
  has_many :shift_employees
  #validates :shift_time_id, uniqueness: { scope: [:from,:to] }
end
