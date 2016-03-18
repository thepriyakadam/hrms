class ProfessionalTax < ActiveRecord::Base
	validates :is_pt, :presence => true
	validates :pt_amount, :presence => true, :numericality => true
end
