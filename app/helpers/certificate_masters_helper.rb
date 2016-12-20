module CertificateMastersHelper
	def all_certificate_master
    CertificateMaster.all.collect { |x| [x.name, x.id] }
  end
end
