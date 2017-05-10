module CertificatesHelper
	def all_certificate_name
    Certificate.all.collect { |x| [x.id, x.id] }
  end
end
