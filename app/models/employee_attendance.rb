class EmployeeAttendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :department
  belongs_to :employee_leav_request
  belongs_to :company_time_master
  belongs_to :machine_attendance
  belongs_to :on_duty_request
  belongs_to :holiday
  belongs_to :employee_week_off
end
