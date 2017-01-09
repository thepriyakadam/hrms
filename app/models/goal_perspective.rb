class GoalPerspective < ActiveRecord::Base
	has_many :goal_ratings
	belongs_to :department
end
