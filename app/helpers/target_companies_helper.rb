module TargetCompaniesHelper
   def all_target_company
		TargetCompany.all.collect { |t| [t.name, t.id] }
	end
end
