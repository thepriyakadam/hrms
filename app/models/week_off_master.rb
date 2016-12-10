class WeekOffMaster < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true

  # def is_present_attendance?
  #   flag = 0
  #   for i in self.from.to_date..self.to.to_date
  #     flag = EmployeeAttendance.exists?(day: i, employee_id: self.employee_id)
  #   end
  #   flag
  # end

end
