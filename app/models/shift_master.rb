class ShiftMaster < ActiveRecord::Base
	has_many :company_time_masters
	has_many :machine_attendances
    has_many :employee_attendances
	validates :code, presence: true
  validates :name, presence: true
end
