class EmployeeDesignation < ActiveRecord::Base
	has_many :joining_details
	validates :name, :presence => true,  uniqueness: { case_sensitive: false }
end
