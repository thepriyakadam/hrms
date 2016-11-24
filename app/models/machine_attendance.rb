class MachineAttendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :shift_master
end
