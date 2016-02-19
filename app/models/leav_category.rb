class LeavCategory < ActiveRecord::Base
	has_many :company_leavs
	has_many :employee_leav_requests
	has_many :employee_leav_balances
  has_many :particular_leave_records

	validates :name, :presence => true,  uniqueness: { case_sensitive: false }
end
