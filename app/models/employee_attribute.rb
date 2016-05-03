class EmployeeAttribute < ActiveRecord::Base
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :attribute_master
  belongs_to :definition
  belongs_to :performance_period
  has_many :attribute_rating_sheets

  validates :performance_period_id, presence: true
end
