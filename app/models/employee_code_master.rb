class EmployeeCodeMaster < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: true }
end
