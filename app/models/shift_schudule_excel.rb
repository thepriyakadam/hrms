class ShiftSchuduleExcel < ActiveRecord::Base
  belongs_to :employee
  belongs_to :shift_time
end
