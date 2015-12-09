module CompaniesHelper
	def all_company_type
		CompanyType.all.collect {|x| [x.name,x.id]}
	end

	def all_company
		Company.all.collect {|x| [x.name,x.id]}
	end
	def all_states
		CS.states(:in).collect {|a,b| b}
	end
	def all_cities
		CS.cities(:mh,:in)
	end
end

