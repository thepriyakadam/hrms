class CompanyTimeMaster < ActiveRecord::Base
	belongs_to :shift_master
	validates :shift_master_id, presence: true
end
