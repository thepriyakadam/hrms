module ListedCompaniesHelper
	def all_listed_companies
    	ListedCompany.all.collect { |x| [x.name, x.id] }
  	end
end
