class ReportingMaster < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, :presence => true,  uniqueness: { case_sensitive: false }
end
