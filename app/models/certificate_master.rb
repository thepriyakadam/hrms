class CertificateMaster < ActiveRecord::Base
	belongs_to :certificate

	validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
