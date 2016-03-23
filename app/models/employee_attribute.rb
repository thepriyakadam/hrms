class EmployeeAttribute < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :attribute_master
  belongs_to :definition

  validates :attribute_master_id ,presence: true
  validates :definition_id ,presence: true
  validates :weightage ,presence: true
end
