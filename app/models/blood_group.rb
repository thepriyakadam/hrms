class BloodGroup < ActiveRecord::Base
	has_many :employees

	# validates :name, uniqueness: true, presence => true
end
