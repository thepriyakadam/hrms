class EmployeeGoal < ActiveRecord::Base
  belongs_to :appraisee,class_name: 'Employee'
  belongs_to :appraiser,class_name: 'Employee'
  belongs_to :goal_perspective
  belongs_to :goal_measure
  has_many :goal_rating_sheets
end
