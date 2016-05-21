class EmployeeGoal < ActiveRecord::Base
  belongs_to :appraisee, class_name: 'Employee'
  belongs_to :appraiser, class_name: 'Employee'
  belongs_to :goal_perspective
  has_many :goal_rating_sheets
  belongs_to :period, class_name: 'PerformancePeriod'
  belongs_to :performance_period
  belongs_to :employee

  validates :goal_perspective_id, presence: true
  validates :goal_measure, presence: true
  validates :target, presence: true
  validates :goal_weightage, presence: true
  validates :difficulty_level, presence: true
  validates :period_id, presence: true

  def goal_weightage_sum(employee_goal)
    previous_goals = EmployeeGoal.where(period_id: employee_goal.period_id, employee_id: employee_goal.employee_id, is_confirm: nil)
    previous_goals.sum(:goal_weightage) + employee_goal.goal_weightage
  end

  def goal_weightage_sumdate(employee_goal, goal_weightage)
    previous_goals = EmployeeGoal.where(period_id: employee_goal.period_id, employee_id: employee_goal.employee_id, is_confirm: nil).where.not(id: employee_goal.id)
    previous_goals.sum(:goal_weightage) + goal_weightage.to_i
  end
end
