class GoalRatingSheet < ActiveRecord::Base
  belongs_to :appraisee, class_name: 'Employee'
  belongs_to :appraiser, class_name: 'Employee'
  belongs_to :employee_goal
  belongs_to :performance_period
  belongs_to :period, class_name: 'PerformancePeriod'
  belongs_to :final_id, class_name: 'Employee'
  belongs_to :appraiser_2, class_name: 'Employee'

  belongs_to :appraisee_rating, class_name: 'RatingMaster'
  belongs_to :appraiser_rating, class_name: 'RatingMaster'
  belongs_to :appraiser2_rating, class_name: 'RatingMaster'
  belongs_to :final_rating, class_name: 'RatingMaster'

  # validates :appraisee_rating, presence: true
  # validates :appraiser_rating, presence: true
  # validates :appraiser2_rating, presence: true
  # validates :final_rating, presence: true
  # validates :appraisee_comment, presence: true
  # validates :appraiser_comment, presence: true
  # validates :appraiser2_comment, presence: true
  # validates :final_comment, presence: true
  #  validate :validate_allign_to_supervisor
  #  def validate_allign_to_supervisor
  #   	if !allign_to_supervisor.is_a?(Array) || allign_to_supervisor.detect{|d| !(yes..no).include?(d)}
  #    	errors.add(:allign_to_supervisor, :invalid)
  #  	end
  # end
end
