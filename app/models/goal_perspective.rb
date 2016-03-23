class GoalPerspective < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	has_many :employee_goals
end
