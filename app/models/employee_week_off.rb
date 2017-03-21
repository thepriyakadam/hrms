class EmployeeWeekOff < ActiveRecord::Base
  belongs_to :week_off_master
  belongs_to :employee

  def is_present(date,employee)
    flag = 0
      flag = EmployeeAttendance.exists?(day: date, employee_id: employee)
    flag
  end

end
