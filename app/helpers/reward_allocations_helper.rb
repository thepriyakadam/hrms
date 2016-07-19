module RewardAllocationsHelper
	def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
  def all_reporting_master_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end
  def all_reward_type
  	RewardType.all.collect {|r| [r.name,r.id]}
  end
end
