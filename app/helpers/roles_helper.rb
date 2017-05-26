module RolesHelper
	def all_role_type
		Role.all.collect { |r| [r.name, r.id] }
	end
	
	def all_role_list
        Role.all.collect { |r| [r.name, r.id] }
    end 
end


