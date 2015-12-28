class CompanyShift < ActiveRecord::Base
	has_many :employee_shifts
	validates :name, :presence => true,  uniqueness: { case_sensitive: false }
end
