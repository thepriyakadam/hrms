class NominationMaster < ActiveRecord::Base
	has_many :employee_nominations
end
