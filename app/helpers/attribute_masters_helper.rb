module AttributeMastersHelper
	def all_attribute_type
		AttributeMaster.all.collect{|a| [a.name,a.id]}
	end

	def department_wise_attribute
		AttributeMaster.where(department_id: current_user.department_id).collect{|a| [a.name,a.id]}
	end
end
