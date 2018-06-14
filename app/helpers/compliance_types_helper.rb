module ComplianceTypesHelper
	def all_compliance_type
		ComplianceType.all.collect { |x| [x.name, x.id] }
	end
end
