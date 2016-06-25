class EmployeeDailyActivity < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project_master

validates :today_activity, presence: true 
validates :tomorrow_plan, presence: true
  
end
