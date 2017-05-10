class Period < ActiveRecord::Base
	has_many :goal_bunches
	validates :name, presence: true,uniqueness: { case_sensitive: false }
end
