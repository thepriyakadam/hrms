class AttributeMaster < ActiveRecord::Base
	has_many :goal_ratings
	validates :code, presence:true ,uniqueness:{case_sensitive:false}
	validates :name,presence:true, uniqueness:{case_sensitive:false}
end
