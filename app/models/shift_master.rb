class ShiftMaster < ActiveRecord::Base
	has_many :company_time_masters
	has_many :machine_attendances
end
