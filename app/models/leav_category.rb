class LeavCategory < ActiveRecord::Base
	has_many :company_leavs
	has_many :employee_leav_requests
end
