class Country < ActiveRecord::Base
	has_many :states
	has_many :companies
	has_many :company_locations
	has_many :employees
	has_many :families
end
