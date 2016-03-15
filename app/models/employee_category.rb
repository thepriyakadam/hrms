class EmployeeCategory < ActiveRecord::Base
	has_many :joining_details 
	validates :name , :presence => true
end
