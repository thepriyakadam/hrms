class ShiftEmployee < ActiveRecord::Base
  belongs_to :shift_schedule
  belongs_to :employee
  belongs_to :shift_time
  belongs_to :created_by, class_name: 'Employee'
end
