class NominationMaster < ActiveRecord::Base
	has_many :employee_nominations

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :code , presence:true,uniqueness:{case_sensitive: false}
end
