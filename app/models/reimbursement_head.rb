class ReimbursementHead < ActiveRecord::Base
	has_many :reimbursement_slabs
	has_many :reimbursement_requests
	validates :code, presence: true,uniqueness: { case_sensitive: false }
	validates :name, presence: true,uniqueness: { case_sensitive: false }
end
