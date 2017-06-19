module PolicyTypesHelper

	def all_policy_type
    PolicyType.all.collect { |x| [x.name, x.id] }
  end
end
