module AttributeMastersHelper
	def all_attribute_type
		AttributeMaster.where(status: true).collect{|a| [a.name.to_s+ ' ( Weightage : '+a.try(:from).to_s+ ' to '+a.try(:to).to_s+')',a.id]}
	end

	def department_wise_attribute
		AttributeMaster.where(department_id: current_user.department_id).collect{|a| [a.name,a.id]}
	end
end
