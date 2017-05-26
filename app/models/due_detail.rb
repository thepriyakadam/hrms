class DueDetail < ActiveRecord::Base
  belongs_to :due_employee_template
  belongs_to :reporting_master
  belongs_to :due_template
  has_many :due_actions
  has_many :due_employee_details
  validates :reporting_master_id, presence: true, uniqueness: true
end
