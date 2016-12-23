module CertificateMastersHelper
	def all_certificate_master
    CertificateMaster.where(status: true).collect { |x| [x.name, x.id] }
  end
end
