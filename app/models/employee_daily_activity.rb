class EmployeeDailyActivity < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project_master
end
