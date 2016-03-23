class PerformancePeriod < ActiveRecord::Base
	validates :title , presence: true
	validates :start_date , presence: true
	validates :end_date , presence: true
	validates :description , presence: true
	validates :is_open , presence: true
	has_many :goal_rating_sheets

	has_many :period_employee_goals, class_name: "EmployeeGoal",
                          foreign_key: "period_id"
end
