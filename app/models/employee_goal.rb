class EmployeeGoal < ActiveRecord::Base
  belongs_to :appraisee,class_name: 'Employee'
  belongs_to :appraiser,class_name: 'Employee'
  belongs_to :goal_perspective
  has_many :goal_rating_sheets
  belongs_to :period,class_name: 'PerformancePeriod'
  belongs_to :performance_period
  belongs_to :employee

  validates :goal_perspective_id ,presence: true
  validates :goal_measure,presence: true
  validates :target ,presence: true
  validates :goal_weightage ,presence: true
  validates :difficulty_level ,presence: true
  validates :period_id ,presence: true
end
