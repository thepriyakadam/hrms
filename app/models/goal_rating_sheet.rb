class GoalRatingSheet < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :employee_goal
end
