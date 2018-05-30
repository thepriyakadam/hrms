module MembershipTypesHelper
	def all_membership_type
    MembershipType.all.collect { |x| [x.name, x.id] }
  end
end
