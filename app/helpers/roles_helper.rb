module RolesHelper
	def all_role_type
		Role.all.collect { |r| [r.name, r.id] }
	end
	def all_reporting_master_list2
		ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.try(:employee).id] }
	end
end


