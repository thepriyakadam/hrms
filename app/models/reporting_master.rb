class ReportingMaster < ActiveRecord::Base
  belongs_to :employee
  belongs_to :interview_schedule
  validates :employee_id, presence: true, uniqueness: { case_sensitive: false }
end
