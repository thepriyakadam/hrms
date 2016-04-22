class GoalRatingSheet < ActiveRecord::Base
  belongs_to :appraisee, class_name: 'Employee'
  belongs_to :appraiser, class_name: 'Employee'
  belongs_to :employee_goal
  belongs_to :performance_period
  belongs_to :period, class_name: 'PerformancePeriod'

  belongs_to :final_id, class_name: 'Employee'
  belongs_to :appraiser2, class_name: 'Employee'
  #  validate :validate_allign_to_supervisor
  #  def validate_allign_to_supervisor
  #   	if !allign_to_supervisor.is_a?(Array) || allign_to_supervisor.detect{|d| !(yes..no).include?(d)}
  #    	errors.add(:allign_to_supervisor, :invalid)
  #  	end
  # end
end
