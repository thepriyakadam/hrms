module RewardAllocationsHelper
	def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
 
  def all_reward_type
  	RewardType.all.collect {|r| [r.name,r.id]}
  end
end
