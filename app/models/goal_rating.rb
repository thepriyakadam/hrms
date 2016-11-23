class GoalRating < ActiveRecord::Base
  scope :find_lazy, -> (current_user,goal_bunch) { where(:id => current_user, ) }
  belongs_to :goal_bunch
  belongs_to :goal_perspective
  belongs_to :goal_setter
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :appraiser_rating
  belongs_to :reviewer
  belongs_to :attribute_master
  belongs_to :appraisee_rating

  belongs_to :appraisee, class_name: 'Employee'
  belongs_to :appraiser, class_name: 'Employee'
  belongs_to :reviewer, class_name: 'Employee'

  #validates :goal_perspective_id, presence: true
  #validates :attribute_master_id, presence: true

  def goal_weightage_sum(goal_bunch, goal_rating)
    previous_weightage = goal_bunch.goal_ratings.sum(:goal_weightage)
    previous_weightage + goal_rating.goal_weightage
  end

  def goal_weightage_sumdate(goal_bunch, goal_weightage, params)
    previous_goals = GoalRating.where(goal_bunch: goal_bunch.id)
    prev_total = previous_goals.sum(:goal_weightage) - goal_weightage.to_i
    prev_total + params[:goal_rating][:goal_weightage].to_i
  end
end
