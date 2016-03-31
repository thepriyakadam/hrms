module EmployeeAttributesHelper
	def all_attribute_type
		AttributeMaster.all.collect {|x| [x.name,x.id]}
	end

	def all_definition_type
		Definition.all.collect {|x| [x.name,x.id]}
	end
end

