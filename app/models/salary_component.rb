class SalaryComponent < ActiveRecord::Base
	scope :deducted, -> { where(is_deducted: true) }
	scope :addected, -> { where(is_deducted: false) }
	validates :name, :code, presence: true, uniqueness: { case_sensitive: false }
end
