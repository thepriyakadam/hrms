class Attendance < ActiveRecord::Base
  belongs_to :employee_shift
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: [:attendance_date] }
end
