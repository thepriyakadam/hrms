class Nationality < ActiveRecord::Base
	has_many :employees
end
