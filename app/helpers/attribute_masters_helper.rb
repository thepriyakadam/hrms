module AttributeMastersHelper
	def all_attribute_type
		AttributeMaster.all.collect{|a| [a.name,a.id]}
	end
end
