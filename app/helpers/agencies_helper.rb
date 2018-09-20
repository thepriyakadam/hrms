module AgenciesHelper
	def all_agency_type
		Agency.where(is_active: true).collect { |x| [x.name, x.id] }
	end
end


