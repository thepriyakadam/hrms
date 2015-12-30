class Attendance < ActiveRecord::Base
  belongs_to :employee_shift
  belongs_to :employee
end
