class EmployeeAttribute < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :attribute_master
  belongs_to :definition
  belongs_to :performance_period
  has_many :attribute_rating_sheets

  validates :performance_period_id, presence: true
  validates :attribute_master_id, presence: true
  validates :weightage, presence: true

  def attribute_weightage_sum(employee_attribute)
    previous_attributes = EmployeeAttribute.where(performance_period_id: employee_attribute.performance_period_id, employee_id: employee_attribute.employee_id, is_confirm: nil)
    previous_attributes.sum(:weightage) + employee_attribute.weightage.to_i
  end

  def attribute_weightage_sumdate(employee_attribute, goal_weightage)
    previous_attributes = EmployeeAttribute.where(performance_period_id: employee_attribute.performance_period_id, employee_id: employee_attribute.employee_id, is_confirm: nil).where.not(id: employee_attribute.id)
    previous_attributes.sum(:weightage) + goal_weightage.to_i
  end
end
