class AdvanceSalary < ActiveRecord::Base
	belongs_to :employee
	belongs_to :advance_type
	has_many :instalments
end
