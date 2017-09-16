module TargetCompaniesHelper
   def all_target_company
		TargetCompany.where(status: true).collect { |t| [t.name, t.id] }
	end
end
