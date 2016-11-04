class DaMaster < ActiveRecord::Base
	validates :minimum_wages, presence: true

end
