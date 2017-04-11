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

  belongs_to :appraisee_rating, class_name: 'Rating'
  belongs_to :appraiser_rating, class_name: 'Rating'
  #validates :goal_perspective_id, presence: true
  #validates :attribute_master_id, presence: true
  validates_length_of :goal_measure, :maximum => 3000

  def goal_weightage_sum(goal_bunch, goal_rating)
    previous_weightage = goal_bunch.goal_ratings.sum(:goal_weightage)
    previous_weightage + goal_rating.goal_weightage
  end

  def goal_weightage_sumdate(goal_bunch, goal_weightage, params)
    previous_goals = GoalRating.where(goal_bunch: goal_bunch.id)
    prev_total = previous_goals.sum(:goal_weightage) - goal_weightage.to_i
    prev_total + params[:goal_rating][:goal_weightage].to_i
  end

  def goal_id_sum(goal_rating)
    previous_weightage = GoalRating.where(goal_perspective_id: goal_rating.goal_perspective_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    weightage + goal_rating.goal_weightage
  end

  def attribute_id_sum(goal_rating)
    previous_weightage = GoalRating.where(attribute_master_id: goal_rating.attribute_master_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    weightage + goal_rating.goal_weightage
  end

  def goal_id_sum_update(goal_rating,weightage1)
    previous_weightage = GoalRating.where(goal_perspective_id: goal_rating.goal_perspective_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    goal_rating1 = previous_weightage.find_by(id: goal_rating.id)
    weigh = goal_rating1.goal_weightage
    weightage = previous_weightage.sum(:goal_weightage) - weigh.to_i
     weightage + weightage1
  end

  def attribute_id_sum_update(goal_rating,weightage1)
    previous_weightage = GoalRating.where(attribute_master_id: goal_rating.attribute_master_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    goal_rating1 = previous_weightage.find_by(id: goal_rating.id)
    weigh = goal_rating1.goal_weightage
    weightage = previous_weightage.sum(:goal_weightage) - weigh.to_i
     weightage + weightage1
  end
end
