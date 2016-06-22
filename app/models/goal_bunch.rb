class GoalBunch < ActiveRecord::Base
  belongs_to :period
  belongs_to :employee
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :reviewer
  belongs_to :reviewer_rating
  belongs_to :final
  belongs_to :final_rating
  has_many :goal_ratings

  validates_uniqueness_of :period_id, :scope => :employee_id
end
