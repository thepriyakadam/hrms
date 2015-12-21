class CompanyShift < ActiveRecord::Base
	has_many :employee_shifts
end
