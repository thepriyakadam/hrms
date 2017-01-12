class EmployeeWeekOff < ActiveRecord::Base
  belongs_to :week_off_master
  belongs_to :employee
end
