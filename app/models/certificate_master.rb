class CertificateMaster < ActiveRecord::Base
	has_many :certificates

	validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
